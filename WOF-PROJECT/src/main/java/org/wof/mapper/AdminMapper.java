package org.wof.mapper;

import java.util.List;

import org.wof.domain.ClientVO;
import org.wof.domain.Standard;

public interface AdminMapper {

	public int getTotalCount();
	
	public int TotalMember();
	
	public int RegisterCompany();
	
	public List<ClientVO> CompanyList(Standard standard);
	public int CompanyListTotal(Standard standard);
}
