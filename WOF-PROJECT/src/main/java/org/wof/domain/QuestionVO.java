package org.wof.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QuestionVO implements Serializable {

	private String quest_id;
	private int quest_no;
	private int quest_type;
	private String quest_title;
	private String quest_writer;
	private String quest_contents;
	private Date quest_reg_date;
	private Date quest_update_date;
	private int quest_ans_check;
	private int quest_deleted;
	
	private List<QuestAttachVO> AttachList;
}
