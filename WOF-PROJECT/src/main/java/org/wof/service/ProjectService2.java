package org.wof.service;

import java.util.List;

import org.wof.domain.*;

public interface ProjectService2 {
	

	public List<ProjectVO> projectList();
	public ProjectVO projectList2(String proj_id);
	public int totalProject();
	public void RecommendSendMail();
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public List<ProjectVO> followProjectList(String related_member);
	public FollowProjectVO followProjectDetail(FollowProjectVO vo);
	//public int addMeeting(MeetVO meetVO);

}