package org.wof.domain;

import lombok.Data;

@Data
public class ContractVO {
	
	private String contract_write_source;	
	private String related_proj;
	private String contract_write_target;
	private String source_signature;
	private String target_signature;

}
