package org.wof.mapper;

import java.util.List;

import org.wof.domain.ContractTargetVO;
import org.wof.domain.ProjectAttachVO;
import org.wof.domain.ProjectVO;

public interface ProjectAttachMapper {

	public void insert(ProjectAttachVO vo);
	
	public List<ContractTargetVO> checkAuth(String member_no);
	
	public void delete(String uuid);
	
	public List<ProjectAttachVO> findByPno(String proj_id);
	
	public void deleteAll(String proj_id);
	
}
