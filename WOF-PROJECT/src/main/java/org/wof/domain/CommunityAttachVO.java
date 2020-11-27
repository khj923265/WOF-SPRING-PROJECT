package org.wof.domain;

import lombok.Data;

@Data
public class CommunityAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;
	
}
