package org.wof.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ContractVO {
	
	//나은 추가
	private int business_register_no; //PK
	private String proj_id; //FK 
	private String client;
	private String partner;
	private int proj_estimate;
	private String proj_title;
	private Date proj_start_date;
	private Date proj_end_date;  

}
