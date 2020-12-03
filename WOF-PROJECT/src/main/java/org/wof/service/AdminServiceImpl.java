package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.ClientVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;

	@Override
	public int getTotal() {
		return adminMapper.getTotalCount();
	}

	@Override
	public int TotalMember() {
		return adminMapper.TotalMember();
	}

	@Override
	public int RegisterCompany() {
		return adminMapper.RegisterCompany();
	}

	@Override
	public List<ClientVO> CompanyList(Standard standard) {
		return adminMapper.CompanyList(standard);
	}

	@Override
	public int CompanyListTotal(Standard standard) {
		return adminMapper.CompanyListTotal(standard);
	}
}
