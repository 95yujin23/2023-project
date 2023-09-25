package me.bobit.myapp.cdetail.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.cdetail.service.CdetailVO;

@Repository
public class CdetailDaoImpl implements CdetailDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("cdetail.total", pager);
	}

	@Override
	public List<CdetailVO> selectCdetailList(Pager pager) {
		return sql.selectList("cdetail.selectcdetaillist", pager);
	}

	@Override
	public CdetailVO selectCdetail(int cdetailNo) {
		return sql.selectOne("cdetail.selectcdetail", cdetailNo);
	}
	
	@Override
	public void insertCdetail(CdetailVO vo) {
		sql.insert("cdetail.insertcdetail", vo);
	}

	@Override
	public void updateCdetail(CdetailVO vo) {
		sql.update("cdetail.updatecdetail", vo);

	}

	@Override
	public void deleteCdetail(int cdetailNo) {
		sql.delete("cdetail.deletecdetail", cdetailNo);
	}

}
