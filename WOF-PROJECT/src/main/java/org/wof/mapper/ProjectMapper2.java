package org.wof.mapper;

import java.util.List;

import org.wof.domain.*;

public interface ProjectMapper2 {

	public List<ProjectVO> ProjectList(Standard standard);
	public int totalProject();
	public int addFollowProject(FollowProjectVO followProjectVO);
	public int deleteFollowProject(String related_project);
	public int addMeeting(MeetVO meetVO);
	public List<FollowProjectVO> followProjectList();
	public int projectStatusUpdate();
	public List<ProjectVO> locationProject();

}