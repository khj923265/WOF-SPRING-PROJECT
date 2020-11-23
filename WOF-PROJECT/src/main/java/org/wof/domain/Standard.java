package org.wof.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;

/*
 * pagination을 위한 기준
 * 
 * [2020-11-18 김태완]
 */

@ToString
@Data
public class Standard {

	private int pageNum;	// 페이지 번호
	private int amount;		// 페이지 당 보여줄 데이터 개수

	
	private String type;
	private String keyword;
	
	/*
	 * constructor
	 */
	public Standard() {
		this(1, 10);	// 기본값 : 1 페이지 당 10개 표시
	}
	
	public Standard(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
		//배열의 내용을 각각 자르기 위함
	}
	
	
	//파일 게시물 삭제하고 검색조건 유지하기 위해서
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
	
	
}
