package org.wof.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.*;
import org.wof.mapper.MemberMapper;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@AllArgsConstructor
@Service
@Log4j
public class MemberServiceImpl implements MemberService{

    private final PasswordEncoder passwordEncoder;
    private final MemberMapper mapper;

    //아이디 확인
    @Override
    public String checkId(String userid) {
        return mapper.checkId(userid);
    }

    //회원가입
    @Transactional
    @Override
    public void sginUp(MemberVO memberVO) {
        memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));

        AuthVO authVO = new AuthVO();
        authVO.setUserid(memberVO.getUserid());
        authVO.setAuth(memberVO.getAuth());

        mapper.signUp(memberVO);
        mapper.insertAuth(authVO);

        if (memberVO.getAuth().equals("ROLE_PARTNERS")){
            mapper.signUpPartners(memberVO);
        }else if (memberVO.getAuth().equals("ROLE_CLIENT")){
            mapper.signUpClient(memberVO);
        }

    }
    //파트너스 정보
    @Override
    public PartnersVO partnersInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.partnersInfo(member_no);
    }
    //클라이언트 정보
    @Override
    public ClientVO clientInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.clientInfo(member_no);
    }
    //비밀번호 확인
    @Override
    public String checkPw(MemberVO memberVO) {
        String data = "0";
        String userPwCh = mapper.checkPw(memberVO.getMember_no());

        if(passwordEncoder.matches(memberVO.getUserpw(),userPwCh)){
            data = "1";
        }
        return data;
    }
    //회원탈퇴
    @Override
    public void Withdrawal(MemberVO memberVO) {
        mapper.Withdrawal(memberVO);
    }

    //파트너스 회원정보수정
    @Transactional
    @Override
    public void partnersUpdate(MemberVO memberVO,PartnersVO partnersVO) {
            //비밀번호가 입력이 안된경우
        if (memberVO.getUserpw() == null||memberVO.getUserpw().equals("")) {
            mapper.userPhoneUpdate(memberVO);
        }else {//비밀번호가 입력된 경우
            memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
             mapper.partnersUpdate3(memberVO);
        }
        mapper.partnersUpdate2(partnersVO);
    }
    //로그인시 회원 상태체크,로그인날짜 최신화
    @Override
    public String loginIdPwCheck(MemberVO memberVO) {

        String status = mapper.loginIdCheck(memberVO.getUserid());
        if (status != null) {
            if (mapper.kakaoIdCheck(memberVO.getUserid()).contains("kakao")) {
                status = "4";
            }else if (status.equals("탈퇴")) {
                status = "1";
            } else if (status.equals("휴면")) {
                status = "2";
            } else if (status.equals("정상")){
                if (!passwordEncoder.matches(memberVO.getUserpw(),mapper.checkPw2(memberVO.getUserid()))){
                    status = "6";//비밀번호 false
                }else{
                mapper.loginsysdate(memberVO.getUserid());
                status = "5";
                }
            }
        }else {
            status = "3";//아이디없음
        }

        return status;
    }

    @Transactional
    @Override
    public void clientUpdate(MemberVO memberVO, ClientVO clientVO) {
        //비밀번호가 입력이 안된경우
        if (memberVO.getUserpw() == null|| memberVO.getUserpw().equals("")) {
            mapper.userPhoneUpdate(memberVO);
            mapper.clientUpdate2(clientVO);
        }else {//비밀번호가 입력된 경우
            memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
            mapper.clientUpdate3(memberVO);
            mapper.clientUpdate2(clientVO);
        }
    }

    @Override
    public List<ProjectProfileVO> projectProfileList(String userid) {
        return mapper.projectProfileList(userid);
    }

    @Override
    public void projectprofileinsert(ProjectProfileVO projectProfileVO) {
        projectProfileVO.setStartDateFormat(LocalDate.parse(projectProfileVO.getStartdate()));
        projectProfileVO.setEndDateFormat(LocalDate.parse(projectProfileVO.getEnddate()));
        mapper.projectprofileinsert(projectProfileVO);
    }

    @Override
    public ProjectProfileVO projectprofileinfo(String userid) {
        return mapper.projectprofileinfo(userid);
    }
    //자기소개 수정
    @Override
    public void profileupdate(PartnersVO partnersVO) {
        mapper.profileupdate(partnersVO);
    }

    @Override
    public void projectprofiledelete(String no) {
        mapper.projectprofiledelete(no);
    }
    //프로젝트 프로파일 수정
    @Override
    public void projectProfileUpdate(ProjectProfileVO projectProfileVO) {
        projectProfileVO.setStartDateFormat(LocalDate.parse(projectProfileVO.getStartdate()));
        projectProfileVO.setEndDateFormat(LocalDate.parse(projectProfileVO.getEnddate()));
        mapper.projectProfileUpdate(projectProfileVO);
    }
    //미팅 수정
    @Override
    public void meetingupdate(MeetVO meetVO) {
        mapper.meetingupdate(meetVO);
    }

    @Override
    public MeetVO meetInfo(String meet_id) {
        return mapper.meetInfo(meet_id);
    }


    //카카오 엑세스토큰 받아오는 메소드
    @Override
    public String kakaoAccessToken(String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=99f3b410c68833a20809dc9bf060d24e");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8081/member/kakaologin");     // 본인이 설정해 놓은 경로
            sb.append("&code=").append(authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch ( IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
    //카카오 유저정보 가져오는 메소드
    @Override
    public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            StringBuilder result = new StringBuilder();

            while ((line = br.readLine()) != null) {
                result.append(line);
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result.toString());

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//            String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
//            userInfo.put("profile_image", profile_image);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }

    //카카오회원가입
    @Transactional
    @Override
    public void kakaoSignup(MemberVO memberVO) {
        memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
        mapper.kakaoSignup(memberVO);
        AuthVO authVO = new AuthVO();
        authVO.setUserid(memberVO.getUserid());
        authVO.setAuth(memberVO.getAuth());
        memberVO.setMember_no(memberVO.getMember_no());
        mapper.insertAuth(authVO);
        mapper.signUpPartners(memberVO);
    }

    //아이디 찾기
    @Override
    public String findIdForm(MemberVO memberVO) {
        String userid;
        int count = mapper.findIdCount(memberVO);
        if(count == 0){
            userid = "anonymousUser";
            return userid;
        } else {
            userid = mapper.findIdForm(memberVO);
            String regex = "\\b(\\S+)+@(\\S+.\\S+)";
            Matcher matcher = Pattern.compile(regex).matcher(userid);
            if (matcher.find()) {
                String id = matcher.group(1);

                int length = id.length();
                if (length < 3) {
                    char[] c = new char[length];
                    Arrays.fill(c, '*');
                    return userid.replace(id, String.valueOf(c));
                } else if (length == 3) {
                    return userid.replaceAll("\\b(\\S+)[^@][^@]+@(\\S+)", "$1**@$2");
                } else {
                    return userid.replaceAll("\\b(\\S+)[^@][^@][^@]+@(\\S+)", "$1***@$2");
                }
            }
            return userid;
        }
    }

    //비밀번호 찾기
    @Transactional
    @Override
    public String findPwForm(MemberVO memberVO) {
        int count = mapper.findPwCount(memberVO);
        String password;
        if (count == 0){
            password = "anonymousUser";
            return password;
        }else{
            password = getTempPassword(12);
            String encodePassword = passwordEncoder.encode(password);
            memberVO.setUserpw(encodePassword);
            mapper.setEncodePassword(memberVO);
            return password;
        }
    }

    //임시비밀번호 난수 생성 함수
    public static String getTempPassword(int length) {
        int index = 0;
        char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
                'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                'w', 'x', 'y', 'z' };

        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < length; i++) {
            index = (int) (charArr.length * Math.random());
            sb.append(charArr[index]);
        }
        return sb.toString();
    }
}
