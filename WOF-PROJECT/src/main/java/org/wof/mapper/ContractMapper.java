package org.wof.mapper;

import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractTargetVO;

public interface ContractMapper {
	
	public ContractSourceVO contractSource(String source_no, String proj_id);
	
	public ContractTargetVO contractTarget(String target_no);

}
