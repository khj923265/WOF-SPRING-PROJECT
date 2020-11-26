package org.wof.domain;

import lombok.Getter;
import lombok.ToString;

/*
 * 화면에서 페이징 처리를 위한 클래스
 * 
 * 	클래스를 구성하면 Controller -> View로 여러 정보를 전달할 때 객체를 생성해서 Model에 담아 보내는 과정이 단순해진다.
 * 
 * [2020-11-18 김태완]
 */

@Getter
@ToString
public class PageDTO {
	
	private int startPage;	// 시작 페이지 번호
	private int endPage;	// 끝 페이지 번호
	private boolean prev, next;		// 이전 페이지, 다음 페이지
	private int total;	// 전체 데이터 수
	private Standard standard;
	
	public PageDTO(Standard standard, int total) {
		this.standard = standard;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(standard.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / standard.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
