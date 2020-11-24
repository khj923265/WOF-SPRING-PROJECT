package org.wof.mapper;

import java.util.List;

import org.wof.domain.*;

public interface ProjectMapper2 {

	public List<ProjectVO> projectList();
	public int totalProject();
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public FollowProjectVO followProjectDetail(FollowProjectVO vo);
	public int addMeeting(MeetVO meetVO);
	public List<ProjectVO> followProjectList(String related_member);
	public int projectStatusUpdate();
	public List<ProjectVO> locationProject();
	public ProjectVO projectList2(String proj_id);
}