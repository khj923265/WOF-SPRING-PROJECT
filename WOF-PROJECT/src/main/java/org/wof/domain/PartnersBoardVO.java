package org.wof.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class PartnersBoardVO {

	private Long bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	private Long viewscnt;
	
	private List<CommunityAttachVO> attachList;
	
}
