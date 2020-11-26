package org.wof.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;
import lombok.Data;

/*
 * pagination�쓣 �쐞�븳 湲곗�
 * 
 * [2020-11-18 源��깭�셿]
 */

@ToString
@Data
public class Standard {

	private int pageNum;	// �럹�씠吏� 踰덊샇
	private int amount;		// �럹�씠吏� �떦 蹂댁뿬以� �뜲�씠�꽣 媛쒖닔

	
	private String type;
	private String keyword;
	
	/*
	 * constructor
	 */
	public Standard() {
		this(1, 10);	// 湲곕낯媛� : 1 �럹�씠吏� �떦 10媛� �몴�떆
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
