package org.wof.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PointVO implements Serializable {
	
	private String point_id;
	private int point_no;
	private int point_balance;
	private String point_type;
	private int point_amount;
	private String point_contents;
	private Date point_chg_date;
	private String point_owner;
	
	private String real_name;
	
}
