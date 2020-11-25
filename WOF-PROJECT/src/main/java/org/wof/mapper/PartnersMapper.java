package org.wof.mapper;

import java.util.List;

import org.wof.domain.ProjectVO;



import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface PartnersMapper {
	
	public List<ProjectVO> applyProject(@Param("member_no") String member_no,
			@Param("standard") Standard standard);
	
	public List<ProjectVO> partnersSupport();
	
	public List<ProjectVO> dashboardpartnersApplyProject(@Param("member_no") String member_no);
	
	public List<PartnersVO> partnersList(
			@Param("member_no")String member_no, 
			@Param("standard") Standard standard);
	
	public int getTotalCount(Standard standard);//파트너스 전체 카운트(페이징처리)
	
	
	public List<PartnersVO>	followList(
			@Param("member_no") String member_no, 
			@Param("standard") Standard standard);//standard는 검색에서 사용하게 되어 넣어둠.
	
	public int followCount(
			@Param("member_no") String member_no, 
			@Param("standard") Standard standard);//관심파트너스에 검색기능이 없을경우 standard는 제외해도 됨.
	
	public String followCheck(FollowPartnersVO followPartnersVO);//관심파트너스 아이디 중복체크
	
	public int followYes(FollowPartnersVO followPartnersVO);//관심파트너스 추가
	
	public int followNo(FollowPartnersVO followPartnersVO);//관심파트너스 삭제
	
	public String clientAddress(String member_no);//로그인한 클라이언트 주소 가저오기
	
	public List<String> projectSkill(String member_no);//프로젝트 스킬 가저오기
	
	public List<PartnersVO> recommend(
			@Param("address") String address, 
			@Param("skillList") List<String> skillList); //지역 + 스킬 매칭 추천	
	
	@Select("select sysdate from dual")//jUnit test
	public String getTime();
	
}
