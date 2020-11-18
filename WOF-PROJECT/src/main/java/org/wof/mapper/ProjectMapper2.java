package org.wof.mapper;

import java.util.List;

import org.wof.domain.Criteria;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.MeetVO;
import org.wof.domain.ProjectVO;

public interface ProjectMapper2 {

	public List<ProjectVO> ProjectList(Criteria cri);
	public int totalProject();
	public int addFollowProject(FollowProjectVO followProjectVO);
	public int deleteFollowProject(String related_project);
	public int addMeeting(MeetVO meetVO);
	public List<FollowProjectVO> followProjectList();

}