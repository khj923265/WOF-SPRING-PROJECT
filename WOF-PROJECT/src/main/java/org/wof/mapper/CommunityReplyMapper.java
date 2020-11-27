package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wof.domain.CommunityReplyVO;
import org.wof.domain.Standard;

public interface CommunityReplyMapper {

	public int insert(CommunityReplyVO vo);
	
	public CommunityReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(CommunityReplyVO reply);
	
	public List<CommunityReplyVO> getListWithPaging(@Param("standard") Standard standard, @Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
	
}
