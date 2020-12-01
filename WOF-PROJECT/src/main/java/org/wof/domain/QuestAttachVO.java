package org.wof.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class QuestAttachVO implements Serializable {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private String quest_no;
}
