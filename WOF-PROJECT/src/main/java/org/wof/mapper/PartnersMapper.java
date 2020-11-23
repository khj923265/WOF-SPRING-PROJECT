package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;

public interface PartnersMapper {
	
	public List<PartnersVO> partnersList(Standard standard);
	
	public int getTotalCount(Standard standard);//파트너스 전체 카운트(페이징처리)
	
	
	public List<PartnersVO>	followList(
			@Param("member_no") String member_no, 
			@Param("standard") Standard standard);//standard는 검색에서 사용하게 되어 넣어둠.
	
	public int followCount(
			@Param("member_no") String member_no, 
			@Param("standard") Standard standard);//관심파트너스에 검색기능이 없을경우 standard는 제외해도 됨.
	
	public List<PartnersVO> recommend();//지역, 보유기술 받아야함.
	
	public String followCheck(FollowPartnersVO followPartnersVO);
	
	public int followYes(FollowPartnersVO followPartnersVO);
	
	public int followNo(FollowPartnersVO followPartnersVO);
	
	

}
