package org.wof.mapper;

import java.util.List;

import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface ProjectMapper {
	public List<ProjectVO> listProject();
	
	public List<ProjectVO> getListWithPaging(Standard stand);

	public int getTotalCount(Standard stand);
	
	public void insertProject(ProjectVO p1);

	public ProjectVO readProject(String proj_id);
	
	public int deleteProject(String proj_id);

	public int updateProject(ProjectVO p1);
	
	public List<ContractVO> checkAuth(String contract_write_target);
	
}
