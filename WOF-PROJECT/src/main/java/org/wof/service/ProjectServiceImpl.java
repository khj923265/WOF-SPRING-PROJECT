package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.mapper.ProjectMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProjectServiceImpl implements ProjectService {

	//@Setter(onMethod_ = {@Autowired})
	private ProjectMapper pm1;
	
	@Override
	public void create(ProjectVO p1) {
		log.info("register..........." + p1);
		pm1.insertProject(p1);
	}

	@Override
	public ProjectVO read(String proj_id) {
		log.info("get......"+proj_id);
		return pm1.readProject(proj_id);
	}

	@Override
	public boolean update(ProjectVO p1) {
		log.info("update......." + p1);
		return pm1.updateProject(p1)==1;
	}

	@Override
	public boolean delete(String proj_id) {
		log.info("remove..." + proj_id);
		return pm1.deleteProject(proj_id)==1;
	}

	@Override
	public List<ProjectVO> getlist(Standard stand) {
		log.info("getList........." + stand);
		return pm1.getListWithPaging(stand);
	}

	@Override
	public int getTotal(Standard stand) {
		log.info("get total count");
		return pm1.getTotalCount(stand);
	}

}
