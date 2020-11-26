package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;
import org.wof.mapper.ProjectReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProjectReplyServiceImpl implements ProjectReplyService {

	@Setter(onMethod_ = @Autowired)
	private ProjectReplyMapper mapper;
	
	@Override
	public int register(ProjectReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public ProjectReplyVO get(String p_rno) {
		return mapper.read(p_rno);
	}

	@Override
	public int modify(ProjectReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(String p_rno) {
		return mapper.delete(p_rno);
	}

	@Override
	public List<ProjectReplyVO> getList(Standard stand, String proj_id) {
		return mapper.getListWithPaging(stand, proj_id);
	}

}
