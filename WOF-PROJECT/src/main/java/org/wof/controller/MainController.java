package org.wof.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * [2020-12-01 KTW]
 * 메인 화면에서 각종 데이터와 공공 DB 호출을 위한 컨트롤러
 */

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.wof.domain.Standard;
import org.wof.service.ProjectService;

import com.ctc.wstx.io.CharsetNames;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {

	private ProjectService ps;

	@GetMapping("/countProject")
	public ResponseEntity<Integer> countProject(Standard standard) {

		return new ResponseEntity<>(ps.getTotal(standard), HttpStatus.OK);

	}//END countProject

	@GetMapping("/countDiffProject")
	public ResponseEntity<Integer> countPrevProject(Standard standard) {
		int prev = ps.getPrev(standard);
		int curr = ps.getCurr(standard);

		int diff = (((curr + prev)-prev)/prev) * 100;

		return new ResponseEntity<>(diff, HttpStatus.OK);

	}//END countProject

	@CrossOrigin
	@GetMapping(value="/publicDB", produces="application/text;charset=utf8")
	public String callApi() {
		StringBuffer sb = new StringBuffer();

		try {
			String str = "http://apis.data.go.kr/1230000/BidPublicInfoService/getBidPblancListInfoCnstwk?";
			str += "ServiceKey=pImNxEehlp%2Bh6MdzBPQj%2BIsEM%2FzzJ9dubnVfrEOJGlvt%2FCc659UVl1Ke4DoMXirDwgrPsaqm3bVUvq1KUbrR5w%3D%3D";
			str += "&type=json&numOfRows=10&pageNo=1";
			str += "&inqryDiv=1&inqryBgnDt=202011010000&inqryEndDt=202012012359";

			URL url = new URL(str);
			HttpURLConnection urlconn = (HttpURLConnection) url.openConnection();
			urlconn.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));

			String returnLine;

			while((returnLine = br.readLine()) != null) {
				sb.append(returnLine);
			}

			urlconn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();

	}//END callApi()



}//END MainController