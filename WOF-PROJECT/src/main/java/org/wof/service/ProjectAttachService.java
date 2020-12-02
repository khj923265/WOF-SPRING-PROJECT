package org.wof.service;

import java.util.List;

import org.wof.domain.ContractTargetVO;
import org.wof.domain.ProjectAttachVO;
import org.wof.domain.ProjectVO;

public interface ProjectAttachService {

	public void register(ProjectVO projectvo);
	
	public List<ContractTargetVO> checkAuth(ContractTargetVO contracttargetVO);
	
	public ProjectVO fileupread(String proj_id);
	
	public boolean remove(String proj_id);
	
	public List<ProjectAttachVO> getAttachList(String proj_id);
	
}
