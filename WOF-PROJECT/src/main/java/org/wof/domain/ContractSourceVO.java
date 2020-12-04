package org.wof.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ContractSourceVO {
	
	private String member_no;
	private String userid;
	private String real_name;
	private String userPhone;
	private String business_register_no;
	private String name;
	private String tel;
	private String address1;
	private String address2;
	private String proj_id;
	private String proj_title;
	//private String proj_start_date;
	private String proj_end_date;
	
	private String contract_write_source;
	private String contract_write_target;

	//나은 추가
	private int proj_estimate; 
	private Date proj_start_date;
}
