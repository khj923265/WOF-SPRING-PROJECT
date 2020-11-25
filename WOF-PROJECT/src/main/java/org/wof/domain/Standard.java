package org.wof.domain;

import lombok.Data;

/*
 * pagination�쓣 �쐞�븳 湲곗�
 * 
 * [2020-11-18 源��깭�셿]
 */

@Data
public class Standard {

	private int pageNum;	// �럹�씠吏� 踰덊샇
	private int amount;		// �럹�씠吏� �떦 蹂댁뿬以� �뜲�씠�꽣 媛쒖닔

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
	
	
}
