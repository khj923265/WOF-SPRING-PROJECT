package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ProjectAttachVO;
import org.wof.domain.ProjectVO;
import org.wof.mapper.ProjectAttachMapper;
import org.wof.mapper.ProjectMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class ProjectAttachServiceImpl implements ProjectAttachService {

	@Setter(onMethod_ = @Autowired)
	private ProjectMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ProjectAttachMapper attachmapper;

	@Override
	public void register(ProjectVO projectvo) {

		if (projectvo.getAttachList() == null || projectvo.getAttachList().size() <= 0) {
			return;
		}

		projectvo.getAttachList().forEach(attach -> {
			attach.setProj_id(projectvo.getProj_id());
			attachmapper.insert(attach);
		});

		log.info(projectvo.getProj_id());
	}

	@Override
	public boolean remove(String proj_id) {

		log.info("파일 삭제 : ");

		attachmapper.deleteAll(proj_id);

		return mapper.deleteProject(proj_id) == 1;

	}

	@Override
	public List<ProjectAttachVO> getAttachList(String proj_id) {

		log.info("파일 번호 : " + proj_id);

		return attachmapper.findByPno(proj_id);
	}

	@Override
	public ProjectVO fileupread(String proj_id) {
		
		log.info("fileupread" + proj_id);
		
		return mapper.readProject(proj_id);
	}
	
	@Override
	public List<ContractTargetVO> checkAuth(ContractTargetVO contracttargetVO) {
		
		log.info("파일 권한 체크");
		
		return attachmapper.checkAuth(contracttargetVO);
	}
}
