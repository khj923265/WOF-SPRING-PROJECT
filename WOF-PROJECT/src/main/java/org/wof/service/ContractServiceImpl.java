package org.wof.service;

import org.springframework.stereotype.Service;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;
import org.wof.mapper.ContractMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ContractServiceImpl implements ContractService {
	
	private ContractMapper contractMapper;

	@Override
	public ContractSourceVO contractSource(String source_no, String proj_id) {
		return contractMapper.contractSource(source_no, proj_id);
	}

	@Override
	public ContractTargetVO contractTarget(String target_no) {
		return contractMapper.contractTarget(target_no);
	}
	
	@Override
	public int sourceRegister(ContractVO contract) {
		return contractMapper.sourceRegister(contract);
	}

}
