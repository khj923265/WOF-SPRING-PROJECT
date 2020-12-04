package org.wof.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int nno;
	private String title;
	private String ncontent;
	private String nwriter;
	private Date nrdate;
	private Date updatedate;
	
	private int nviewcnt;
}
