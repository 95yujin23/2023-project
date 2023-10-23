package me.bobit.myapp.alert.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertVO;

public interface AlertDao {

	int total(Pager pager);

	List<AlertVO> selectAlertList(Pager pager);

	AlertVO selectAlert(int alertNo);

	void sendAlert(AlertVO vo);

	void deleteAlert(int alertNo);

	int newAlert(String memNick);

	void checkAlert(int alertNo);
	
}
