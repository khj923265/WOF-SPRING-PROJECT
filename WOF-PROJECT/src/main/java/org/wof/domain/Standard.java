package org.wof.domain;

import lombok.Data;

/*
 * pagination을 위한 기준
 * 
 * [2020-11-18 김태완]
 */

@Data
public class Standard {

	private int pageNum;	// 페이지 번호
	private int amount;		// 페이지 당 보여줄 데이터 개수

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
	
	
}
