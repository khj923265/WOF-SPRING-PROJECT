package org.wof.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityReplyVO {

	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
