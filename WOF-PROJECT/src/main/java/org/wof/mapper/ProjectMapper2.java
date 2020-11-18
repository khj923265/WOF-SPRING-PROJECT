package org.wof.mapper;

import java.util.List;

import org.wof.domain.FollowProjectVO;
import org.wof.domain.MeetVO;
import org.wof.domain.ProjectVO;

public interface ProjectMapper2 {

	public List<ProjectVO> ProjectList();
	public List<ProjectVO> FollowProjectList();
	public int addFollowProject(FollowProjectVO followProjectVO);
	public int deleteFollowProject(String related_proj);
	public int addMeeting(MeetVO meetVO);

}