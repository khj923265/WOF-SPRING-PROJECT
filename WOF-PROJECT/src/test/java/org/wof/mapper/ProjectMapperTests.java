package org.wof.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wof.domain.ProjectVO;
import org.wof.persistence.DataSourceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProjectMapperTests {

	@Setter(onMethod_=@Autowired)
	private ProjectMapper pm1;
	
/*	@Test
	public void getProjectList() {
		pm1.getList().forEach(project -> log.info(project));
	}
*/
	
	/*@Test
	public void insertProject(){
		ProjectVO p1 = new ProjectVO();
		p1.setProj_title("quant 주식 투자 서비스 구축");
		p1.setProj_apply_deadline("2020-12-01");
		p1.setProj_start_date("2020-12-02");
		p1.setProj_end_date("2021-02-02");
		p1.setProj_estimate(20000000);
		p1.setProj_reqr_person(5);
		p1.setProj_reqr_skill("개발, 임베디드");
		p1.setProj_type(0);
		p1.setProj_career("기타 (지원자 필수요건에 따른 장단점 상담 필요),향후 유지보수, 고도화를 위한 아웃소싱 계획이 있습니다. ");
		p1.setProj_pm(0);
		p1.setProj_work_type(1);
		p1.setProj_work_place("서울시 성동구");
		p1.setProj_work_time("월-금 9시-6시");
		p1.setProj_work_equip(1);
		p1.setProj_walfare(0);
		p1.setProj_detail("프로젝트 개요 :- quant 주식 투자 서비스 프로젝트 우선순위 :- 프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다."
				+ "프로젝트의 목적 : " 
				+ " - 베타 버전을 넘어서 결제등의 서비스가 되어 실제 서비스가 가능한 정도의 제품 개발"
				+ "- 기획안이 나와 있으며, 예전에 웹으로 베타버전을 만들었던 적이 있음"
				+ "- 최대한 빠른 기간안에 완료 되면 좋음"
				+ "- https://www.wishket.com/w/K9kFOHIUIy 이 경쟁사며 서비스의 기능은 경쟁사와 흡사함"
				+ "현재 준비 상황 :"
				+ "- 프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다."
				+ "필요 요소 :"
				+ "- 화면 및 기능 기획"
				+ "- PC 및 Mobile 웹 디자인"
				+ "- PC 및 Mobile 웹 개발"
				+ "- 서버 구축 및 백엔드 개발"
				+ "상세 업무 :"
				+ "- 웹 또는 앱 혹은 다운로드 형 프로그램도 상관은 없으며, 고객들이 주식 데이터를 기반으로 시뮬레이션을 해볼 수 있는것을 목표로 함"
				+ "- 주요기능은 주식 투자 전략 시뮬레이션이 주요 기능"
				+ "- 고객 별 시뮬레이션이 저장이 되고 시뮬레이션 데이터양이 많을 수 있음, 예를 들어 10년치 재무 데이터를 기반으로 시뮬레이션을 고객들이 동시에 여러명이 접속해서 돌려볼 수 있음"
				+ "참고 사이트 :"
				+ "- http://www.quantking.co.kr"
				+ "- 기능 및 UI/UX 는 거의 동일, 추가 서비스 몇개는 추가될 수 있음"
				+ "기타 참고 사항/유의 사항 :");
		
		
		pm1.insertProject(p1);
		log.info(p1);
	}*/
	
	/*@Test
	public void projectRead(){
		ProjectVO p1 = pm1.readProject("project8");
		log.info(p1);
	}*/
	
	/*@Test
	public void ProjectDelete(){
		log.info("DELETE COUNT: "+pm1.deleteProject("project8"));
	}*/
	
	@Test
	public void ProjectUpdate(){
		ProjectVO p1 = new ProjectVO();
		p1.setProj_id("project30");
		p1.setProj_title("quant 주식 투자 서비스 프로젝트");
		p1.setProj_detail("프로젝트 개요 :- quant 주식 투자 서비스 프로젝트 우선순위 :- 프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다.");
		
		int count = pm1.updateProject(p1);
		log.info("UPDATE COUNT: " +count);
		
	}
	
}
