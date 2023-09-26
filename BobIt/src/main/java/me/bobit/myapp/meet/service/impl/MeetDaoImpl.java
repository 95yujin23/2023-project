package me.bobit.myapp.meet.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.meet.service.MeetVO;

@Repository
public class MeetDaoImpl implements MeetDao {
	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("meet.total", pager);
	}

	@Override
	public List<MeetVO> selectMeetList(Pager pager) {
		return sql.selectList("meet.selectmeetlist", pager);
	}

	@Override
	public MeetVO selectMeet(int meetNo) {
		return sql.selectOne("meet.selectmeet", meetNo);
	}

	@Override
	public void insertMeet(MeetVO vo) {
		sql.insert("meet.insertmeet", vo);
	}

	@Override
	public void updateMeet(MeetVO vo) {
		sql.update("meet.updatemeet", vo);
	}

	@Override
	public void deleteMeet(int meetNo) {
		sql.update("meet.deletemeet", meetNo);
	}

}
