package org.wof.service;

import java.util.List;

import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;

public interface ProjectReplyService {
	public int register(ProjectReplyVO vo);
	public ProjectReplyVO get(String p_rno);
	public int modify(ProjectReplyVO vo);
	public int remove(String p_rno);
	public List<ProjectReplyVO> getList(Standard stand, String proj_id);
	
}
