package me.bobit.myapp.alert.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertService;
import me.bobit.myapp.alert.service.AlertVO;

@Service
public class alertServiceImpl implements AlertService {

	@Autowired
	AlertDao dao;
	
	@Override
	public List<AlertVO> selectAlertList(Pager pager)  throws Exception {
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.selectAlertList(pager);
	}

	@Override
	public AlertVO selectAlert(int alertNo)  throws Exception {
		dao.checkAlert(alertNo);
		return dao.selectAlert(alertNo);
	}

	@Override
	public void sendAlert(AlertVO vo)  throws Exception {
		dao.sendAlert(vo);

	}

	@Override
	public void deleteAlert(int alertNo)  throws Exception {
		dao.deleteAlert(alertNo);
	}

	@Override
	public int newAlert(String memNick) {
		return dao.newAlert(memNick);
	}	


}
