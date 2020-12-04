package org.wof.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wof.domain.ClientVO;
import org.wof.domain.NoticeVO;
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
	public int getTotal2() {
		return adminMapper.getTotalCount2();
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

	@Override
	public List<NoticeVO> noticeList(Standard standard) {
			
		log.info("공지사항 리스트");
		return adminMapper.getListWithPaging(standard);
	}

	@Override
	public int getTotal(Standard standard) {
		
		return adminMapper.getTotalCount(standard);
	}

	@Override
	public void register(NoticeVO noticeVO) {
		log.info("작성 : " + noticeVO);
		adminMapper.insertSelectKey(noticeVO);
	}

	@Override
	public NoticeVO get(int nno) {
		return adminMapper.read(nno);
	}

	@Override
	public boolean remove(int nno) {
		log.info("공지사항 삭제");
		
		adminMapper.delete(nno);
		return adminMapper.delete(nno) == 1;
	}
	
	
	@Override
	public boolean modify(NoticeVO noticeVO) {
		return adminMapper.update(noticeVO) == 1;
	}

}
