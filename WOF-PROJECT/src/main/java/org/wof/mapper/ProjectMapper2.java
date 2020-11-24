package org.wof.mapper;

import java.util.List;

import org.wof.domain.*;

public interface ProjectMapper2 {

	public List<ProjectVO> projectList();
	public int totalProject();

	
	public int addMeeting(MeetVO meetVO);
	
	public int projectStatusUpdate();
	public List<ProjectVO> locationProject();
	public ProjectVO projectList2(String proj_id);
	
	//관심프로젝트 등록
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public FollowProjectVO detailFollowProject(FollowProjectVO vo);
	public List<ProjectVO> listFollowProject(String related_member);
}