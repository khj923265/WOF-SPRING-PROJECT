package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;

public interface PartnersBoardMapper {

	public List<PartnersBoardVO> getList();
	
	public List<PartnersBoardVO> getListWithPaging(Standard standard);
	
	public void insert(PartnersBoardVO pboard);
	
	public void insertSelectKey(PartnersBoardVO pboard);
	
	public PartnersBoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(PartnersBoardVO pboard);
	
	public int getTotalCount(Standard standard);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	//public boolean plusCnt(Long bno);
	
}
