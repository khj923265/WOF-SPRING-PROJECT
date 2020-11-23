package org.wof.mapper;

import java.util.List;

import org.wof.domain.*;

public interface ProjectMapper2 {

	public List<ProjectVO> ProjectList();
	public int totalProject();
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String related_project);
	public int addMeeting(MeetVO meetVO);
	public List<ProjectVO> followProjectList();
	public int projectStatusUpdate();
	public List<ProjectVO> locationProject();
	public ProjectVO projectList2(String proj_id);
}