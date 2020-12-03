package org.wof.service;

import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;

public interface ContractService {
	
	public ContractSourceVO contractSource(String source_no, String proj_id);
	
	public ContractTargetVO contractTarget(String target_no);
	
	public int sourceRegister(ContractVO contract);

}
