package me.bobit.myapp.cdetail.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.cdetail.service.CdetailVO;

public interface CdetailDao {

	int total(Pager pager);
	
	List<CdetailVO> selectCdetailList(Pager pager);

	CdetailVO selectCdetail(int cdetailNo);

	void insertCdetail(CdetailVO vo);

	void updateCdetail(CdetailVO vo);

	void deleteCdetail(int cdetailNo);

}
