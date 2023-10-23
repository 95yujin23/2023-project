package me.bobit.myapp.alert.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface AlertService {

	List<AlertVO> selectAlertList(Pager pager) throws Exception;

	AlertVO selectAlert(int alertNo) throws Exception;

	void sendAlert(AlertVO vo) throws Exception;

	void deleteAlert(int alertNo) throws Exception;

	int newAlert(String memNick);

}
