package org.wof.service;

import java.util.List;

import org.wof.domain.*;

public interface ProjectService2 {
	
	public List<ProjectVO> projectList(Standard standard);
	public int totalProject();
	public void RecommendSendMail();
	public int addFollowProject(String related_project);
	public int deleteFollowProject(String related_project);
	//public int addMeeting(MeetVO meetVO);

}