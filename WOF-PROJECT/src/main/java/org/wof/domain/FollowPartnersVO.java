package org.wof.domain;

import lombok.Data;

@Data
public class FollowPartnersVO {
	
	private String followPartners_no;
	private String source_member;
	private String target_member;
	private String following_date;
	
}
