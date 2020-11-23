package org.wof.mapper;

import java.util.List;

import org.wof.domain.ProjectVO;

public interface ProjectMapper {
	public List<ProjectVO> listProject();

	public void insertProject(ProjectVO p1);

	public ProjectVO readProject(String proj_id);
	
	public int deleteProject(String proj_id);

	public int updateProject(ProjectVO p1);
	
}
