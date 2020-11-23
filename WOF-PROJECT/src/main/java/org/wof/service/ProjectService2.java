package org.wof.service;

import java.util.List;

import org.wof.domain.*;

public interface ProjectService2 {
	

	public List<ProjectVO> projectList();
	public ProjectVO projectList2(String proj_id);
	public int totalProject();
	public void RecommendSendMail();
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String related_project);
	public List<ProjectVO> followProjectList();
	//public int addMeeting(MeetVO meetVO);

}