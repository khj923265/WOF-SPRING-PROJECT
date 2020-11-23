package org.wof.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ProjectControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx1;
	
	private MockMvc mockMvc1;
	
	@Before
	public void setup(){
		this.mockMvc1 = MockMvcBuilders.webAppContextSetup(ctx1).build();
	}
	
	@Test
	public void projectList() throws Exception {
		log.info(
			mockMvc1.perform(MockMvcRequestBuilders.get("/project/list"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}

	@Test
	public void projectCreate() throws Exception{
		String resultPage = mockMvc1.perform(MockMvcRequestBuilders.post("/project/create")
				.param("title", "새로운 프로젝트입니다.")).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void projectRead() throws Exception{
		log.info(
				mockMvc1.perform(MockMvcRequestBuilders.get("/project/read")
				.param("proj_id", "project30"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	@Test
	public void projectUpdate() throws Exception{
		String resultPage = mockMvc1.perform(MockMvcRequestBuilders.post("/project/update")
				.param("proj_id", "project30")
				.param("proj_title", "수정된 새 프로젝트 이름입니다."))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void projectDelete() throws Exception{
		String resultPage = mockMvc1.perform(MockMvcRequestBuilders.post("/project/delete")
				.param("proj_id", "project30"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}
