package org.wof.service;

import java.util.List;

import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;

public interface ContractService {
	
	public ContractSourceVO contractSource(String source_no, String proj_id);
	
	public ContractTargetVO contractTarget(String target_no);
	
	public int sourceRegister(ContractVO contract);
	
	public int targetSignature(ContractVO contract);
	
	public List<ContractVO> contractCompletion(String member_no, String auth);

}
