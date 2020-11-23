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

	// 留ㅼ씪 �깉踰� 3�떆�뿉 �봽濡쒖젥�듃 �긽�깭 �뾽�뜲�씠�듃 �떆�궎�뒗 �뒪耳�以꾨윭
	@Scheduled(cron = "* * 3 * * ?")
	public void ProjectStatusUpdate(){
		log.warn("start project status update.....");
		log.warn("====================");
		log.warn(projectMapper2.projectStatusUpdate());
	}
	
	//留ㅼ씪 �삤�썑 2�떆�뿉 �봽濡쒖젥�듃 愿��젴 硫붿씪�쓣 �궇�젮二쇰뒗 �뒪耳�以꾨윭
	/*@Scheduled(cron = "* * 14 * * ?")
	public void SendingMail() {
		log.warn("start sending mail....");
		log.warn("====================");
		projectService2.RecommendSendMail();
	}*/
	
	

}
