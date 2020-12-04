package org.wof.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QuestionVO implements Serializable {

	private String quest_id;
	//private int quest_no;
	//private int quest_type;
	private String quest_title; //제목
	private String quest_writer; //발신자 이름
	private String quest_contents;  //본문
	//private Date quest_reg_date;
	//private Date quest_update_date;
	//private int quest_ans_check;
	//private int quest_deleted;
	
	private String quest_userphone;
	
	private String senderMail;    //발신자 이메일 주소
	private String receiveMail;    //수신자 이메일 주소
	
	//private List<QuestAttachVO> AttachList;
}
