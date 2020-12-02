package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.ProjectReplyVO;
import org.wof.domain.Standard;

public interface ProjectReplyMapper {
	public int insert(ProjectReplyVO vo);
	public ProjectReplyVO read(String rno);
	public int delete(String rno);
	public int update(ProjectReplyVO reply);
	public List<ProjectReplyVO> getListWithPaging(@Param("stand") Standard stand, @Param("pno") String pno);
}
