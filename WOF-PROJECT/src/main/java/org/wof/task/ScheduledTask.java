package org.wof.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.wof.mapper.ProjectMapper2;
import org.wof.service.ProjectService2;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ScheduledTask {
	
	@Autowired
	private ProjectMapper2 projectMapper2;
	
	@Autowired
	private ProjectService2 projectService2;

	// 매일 새벽 3시에 프로젝트 상태 업데이트 시키는 스케줄러
	@Scheduled(cron = "* * 3 * * ?")
	public void ProjectStatusUpdate(){
		log.warn("start project status update.....");
		log.warn("====================");
		projectMapper2.projectStatusUpdate();
	}
	
	//매일 오후 2시에 프로젝트 관련 메일을 날려주는 스케줄러
	@Scheduled(cron = "* * 14 * * ?")
	public void SendingMail() {
		log.warn("start sending mail....");
		log.warn("====================");
		projectService2.RecommendSendMail();
	}
	
	

}
