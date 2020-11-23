package org.wof.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PointVO implements Serializable {
	private String point_id;
	private int point_total;
	private int point_type;
	private int point_amount;
	private String point_contents;
	private Date point_chg_date;
	private String point_owner;
	
	public PointVO() {}

	public PointVO(String point_id, int point_total, int point_type, int point_amount, String point_contents,
			Date point_chg_date, String point_owner) {
		super();
		this.point_id = point_id;
		this.point_total = point_total;
		this.point_type = point_type;
		this.point_amount = point_amount;
		this.point_contents = point_contents;
		this.point_chg_date = point_chg_date;
		this.point_owner = point_owner;
	}
}
