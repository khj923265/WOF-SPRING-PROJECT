package org.wof.domain;

import lombok.Data;

@Data
public class PartnersVO {
	
	private String member_no;
	private String real_name;
	private String birthday;
	private String career;
	private String skill;
	private String prefered_area;
	private String hashtag;
	private String available_date;
	private String profile;
	private String target_member;
	private Standard standard;
	
	private String userid; // 파트너스 선택할 때 필요합니다..
	private String applied_member; // left outer join 때문에 필요합니다..(중복 값 체크)

}
