package org.wof.service;

import java.util.List;

import org.wof.domain.Criteria;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.MeetVO;
import org.wof.domain.ProjectVO;

public interface ProjectService2 {
	
	public List<ProjectVO> projectList(Criteria cri);
	public int totalProject();
	public void RecommendSendMail();
	public int addFollowProject(String related_project);
	public int deleteFollowProject(String related_project);
	//public int addMeeting(MeetVO meetVO);

}