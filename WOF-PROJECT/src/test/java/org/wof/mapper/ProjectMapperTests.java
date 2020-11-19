package org.wof.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.Criteria;
import org.wof.domain.FollowProjectVO;
import org.wof.domain.ProjectVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectMapperTests {

	@Autowired
	private ProjectMapper2 projectMapper2;
	
/*	@Test
	public void testaddFollowProjectMapper() {
		FollowProjectVO vo = new FollowProjectVO();
		vo.setFollowproject_no("followproject1");
		vo.setRelated_member("member27");
		vo.setRelated_project("project1");
		log.info(projectMapper2.addFollowProject(vo));
	}*/
	
/*	@Test
	public void testdeleteFollowProjectMapper() {
		//로그인된 파트너 회원의 팔로우 프로젝트를 지울 수 있다.
		log.info(projectMapper2.deleteFollowProject("project1"));
	}*/
	
/*	@Test
	public void testpageFollowProjectList(){
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		List<ProjectVO> list = projectMapper2.ProjectList(cri);
		list.forEach(project -> log.info(project.getProj_id()));
	}*
	
/*	@Test
	public void testPageMapper(){
		//검색과 페이징처리 한번에하기
		Criteria cri = new Criteria();
		cri.setKeyword("노원");
		cri.setType("TC");
		log.info(projectMapper2.ProjectList(cri));
	}*/
	
/*	@Test
	public void testFollowProjectList(){
		log.info(projectMapper2.followProjectList());
	}*/
	
	@Test
	public void testProjectStatusUpdate(){
		log.info(projectMapper2.projectStatusUpdate());
	}

}
