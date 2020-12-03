package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;

public interface ContractMapper {
	
	public ContractSourceVO contractSource(
			@Param("source_no") String source_no, 
			@Param("proj_id") String proj_id);
	
	public ContractTargetVO contractTarget(String target_no);
	
	public int sourceRegister(ContractVO contract);
	
	public int targetSignature(ContractVO contract);
	
	public List<ContractVO> contractCompletion(
			@Param("member_no") String member_no, 
			@Param("auth") String auth);
	

}
