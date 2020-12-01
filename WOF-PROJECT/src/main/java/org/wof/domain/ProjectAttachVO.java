package org.wof.domain;

import lombok.Data;

@Data
public class ProjectAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private String proj_id;
}
