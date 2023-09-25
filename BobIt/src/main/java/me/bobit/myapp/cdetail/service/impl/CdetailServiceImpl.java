package me.bobit.myapp.cdetail.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.cdetail.service.CdetailService;
import me.bobit.myapp.cdetail.service.CdetailVO;

@Service
public class CdetailServiceImpl implements CdetailService {
	@Autowired
	CdetailDao dao;

	@Override
	public List<CdetailVO> selectCdetailList(Pager pager) throws Exception {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectCdetailList(pager);
	}

	@Override
	public CdetailVO selectCdetail(int cdetailNo) throws Exception {
		return dao.selectCdetail(cdetailNo);
	}
	
	@Override
	public void insertCdetail(CdetailVO vo) throws Exception {
		dao.insertCdetail(vo);		
	}

	@Override
	public void updateCdetail(CdetailVO vo) throws Exception {
		dao.updateCdetail(vo);
		
	}

	@Override
	public void deleteCdetail(int cdetailNo) throws Exception {
		dao.deleteCdetail(cdetailNo);		
	}
	


	
	
}
