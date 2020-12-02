package org.wof.service;

import java.util.List;

import org.wof.domain.*;

public interface ProjectService2 {
	

	public List<ProjectVO> projectList(Standard stand);
	public int totalList(Standard stand);
	public ProjectVO projectDetail(String proj_id);
	public List<ProjectVO> listRecommendProject(PartnersVO vo);
	
	public void RecommendSendMail(String loginUser, Standard stand);
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public List<ProjectVO> listFollowProject(String related_member);
	public FollowProjectVO detailFollowProject(String related_project, String related_member);
	
	
	public List<MeetVO> listMeeting(String meet_req_mem);
	public int addMeeting(MeetVO vo);
	public int deleteMeeting(String meet_id);

}