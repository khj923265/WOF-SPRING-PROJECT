package org.wof.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ContractVO {
	
	private String contract_write_source;	
	private String related_proj;
	private String contract_write_target;
	private String source_signature;
	private String target_signature;


	private int business_register_no; //PK
	private String proj_id; //FK 
	private String client;
	private String partner;
	private int proj_estimate;
	private String proj_title;
	private Date proj_start_date;
	private Date proj_end_date;  

}
