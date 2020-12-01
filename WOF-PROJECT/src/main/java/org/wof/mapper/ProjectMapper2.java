package org.wof.mapper;

import java.util.List;

import org.wof.domain.*;

public interface ProjectMapper2 {

	public List<ProjectVO> projectList(Standard stand);
	public int totalProject(Standard stand);
	public List<ProjectVO> listRecommendProject(PartnersVO vo);
	public List<ProjectVO> pageWithProject(Standard standard);
	
	//일정관리
	public List<MeetVO> listMeeting(String meet_req_mem);
	public int addMeeting(MeetVO vo);
	public int deleteMeeting(String meet_id);
	public int updateMeeting(MeetVO vo);
	
	public int projectStatusUpdate();
	public List<ProjectVO> locationProject();
	public ProjectVO projectDetail(String proj_id);
	
	//관심프로젝트 등록
	public int addFollowProject(FollowProjectVO vo);
	public int deleteFollowProject(String followproject_no);
	public FollowProjectVO detailFollowProject(FollowProjectVO vo);
	public List<ProjectVO> listFollowProject(String related_member);
}

