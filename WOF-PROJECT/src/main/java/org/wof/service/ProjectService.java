package org.wof.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.ApplyVO;
import org.wof.domain.ContractTargetVO;
import org.wof.domain.ContractVO;
import org.wof.domain.ProjectAttachVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface ProjectService {
	public void create(ProjectVO p1);
	public ProjectVO read(String proj_id);
	public boolean update(ProjectVO p1);
	public boolean delete(String proj_id);
	public List<ProjectVO> getListWithPaging(Standard standard);	// KTW. 페이징 처리된 프로젝트 목록
	public int getTotal(Standard standard);		// KTW.
	public int getPrev(Standard standard);		// KTW.
	public int getCurr(Standard standard);		// KTW.
	public void apply(ApplyVO applyvo);	// KTW. 모달창을 통해 프로젝트 지원하기
	
	
	//public List<ContractVO> checkAuth(String contract_write_target);
	//public List<ProjectAttachVO> getAttachList(String proj_id);
}
