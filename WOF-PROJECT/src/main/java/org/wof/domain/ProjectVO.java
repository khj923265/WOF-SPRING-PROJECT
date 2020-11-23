package org.wof.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProjectVO {
	
	private String proj_id;					// 프로젝트 관리번호
	private String proj_title;				// 제목
	private String proj_reg_date;			// 등록일
	private String member_no;				// 등록자
	private String proj_apply_deadline;		// 지원 마감일
	private String proj_start_date;			// 예상 시작일
	private String proj_end_date;			// 예상 종료일
	private int proj_total_date;			// 총 일수
	private int proj_estimate;				// 예산
	private int proj_reqr_person;			// 필요 인원
	private String proj_reqr_skill;			// 필요 기술
	private int proj_type;					// 0 : 아이디어, 1 : 기획, 2 : 개발
	private String proj_career;				// 모집 요건
	private int proj_pm;					// pm유무(0 : 유, 1 : 무)
	private int proj_work_type;				// 근무 형태(0 : 자택, 1 : 회사)
	private String proj_work_place;			// 근무 장소
	private String proj_work_time;			// 근무 시간
	private int proj_work_equip;			// 장비 제공(0 : 개인 장비, 1 : 장비 제공)
	private int proj_walfare;				// 복지(0 : 음식 제공, 1 : 음식 미제공)
	private String proj_detail;				// 프로젝트 상세 내용
	private String proj_finish_date;		// 실제 종료일
	private int apply_mem;					// 지원자수
	private int proj_status;				// 현재 상태(0 : 모집중, 1 : 진행중, 2 : 완료)
	private String proj_update_date;		// 변경일
	private int proj_replyCnt;				// 댓글 개수
	
	//private List<ProjectAttachVO> proj_attachList;
	
}