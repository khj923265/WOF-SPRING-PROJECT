package org.wof.service;

import java.util.List;

import org.wof.domain.ClientVO;
import org.wof.domain.Standard;

public interface AdminService {

	public int getTotal();

	public int TotalMember();
	
	public int RegisterCompany();
	
	public List<ClientVO> CompanyList(Standard standard);
	public int CompanyListTotal(Standard standard);
}
