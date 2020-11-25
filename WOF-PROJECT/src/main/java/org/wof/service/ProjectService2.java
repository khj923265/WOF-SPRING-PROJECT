package org.wof.service;

import java.util.List;

import org.wof.domain.*;

public interface ProjectService2 {
	

	public List<ProjectVO> projectList();
	public ProjectVO projectList2(String proj_id);
	public void RecommendSendMail();
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public List<ProjectVO> listFollowProject(String related_member);
	public FollowProjectVO detailFollowProject(FollowProjectVO vo);
	//public int addMeeting(MeetVO meetVO);

}