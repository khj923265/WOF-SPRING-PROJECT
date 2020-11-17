package org.wof.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MeetVO implements Serializable {
	private String meet_id;
	private String meet_req_mem;
	private int meet_type;
	private String meet_datetime;
	private String meet_contents;
}