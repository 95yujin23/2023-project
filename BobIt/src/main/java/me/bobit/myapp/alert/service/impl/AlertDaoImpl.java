package me.bobit.myapp.alert.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertVO;

@Repository
public class AlertDaoImpl implements AlertDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("alert.total", pager);
	}

	@Override
	public List<AlertVO> selectAlertList(Pager pager) {
		return sql.selectList("alert.selectalertlist", pager);
	}

	@Override
	public AlertVO selectAlert(int alertNo) {
		return sql.selectOne("alert.selectalert", alertNo);
	}

	@Override
	public void sendAlert(AlertVO vo) {
		sql.insert("alert.sendalert", vo);

	}

	@Override
	public void deleteAlert(int alertNo) {
		sql.update("alert.deletealert", alertNo);
	}

	@Override
	public int newAlert(String memNick) {
		return sql.selectOne("alert.newalert", memNick);
		
	}

	@Override
	public void checkAlert(int alertNo) {
		sql.update("alert.checkalert", alertNo);		
	}

}
