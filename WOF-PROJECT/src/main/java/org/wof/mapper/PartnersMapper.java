package org.wof.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.wof.domain.FollowPartnersVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.Standard;

public interface PartnersMapper {
	
	public List<PartnersVO> partnersList(Standard std);
	
	public List<PartnersVO> recommend();//지역, 보유기술 받아야함.
	
	public List<PartnersVO>	followList(String member_no);//membar_no String으로 안돼면 객채로..
	
	public String followCheck(FollowPartnersVO followPartnersVO);
	
	public int followYes(FollowPartnersVO followPartnersVO);
	
	public int followNo(FollowPartnersVO followPartnersVO);

}
