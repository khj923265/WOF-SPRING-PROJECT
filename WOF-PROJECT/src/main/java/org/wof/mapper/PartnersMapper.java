package org.wof.mapper;

import java.util.List;

import org.wof.domain.ProjectVO;

public interface PartnersMapper {

	public List<ProjectVO> applyProject();
	public List<ProjectVO> partnersSupport();
	
	public List<ProjectVO> dashboardpartnersApplyProject();
}
