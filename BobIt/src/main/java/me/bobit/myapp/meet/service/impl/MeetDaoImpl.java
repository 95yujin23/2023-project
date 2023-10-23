package me.bobit.myapp.meet.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.mtapply.service.MtapplyVO;
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

	@Override
	public void insertMeetJang(MeetVO jvo) {
		sql.insert("meet.insertmeetjang", jvo);
		
	}

	@Override
	public int selectLastInsertedMeetNo() {
		return sql.selectOne("meet.selectlastinsertedmeetno");
	}

	@Override
	public void insertMeetImg(Map<String, Object> map) {
		sql.update("meet.insertmeetimg", map);
		
	}

	@Override
	public List<MeetVO> selectIndexList() {
		return sql.selectList("meet.selectindexlist");
	}

	@Override
	public List<MeetVO> selectMeetJangList(Pager pager) {
		return sql.selectList("meet.selectmeetjanglist", pager);
	}

	@Override
	public List<MtapplyVO> selectMeetApplyList(Pager pager) {
		return sql.selectList("meet.selectmeetapplylist", pager);
	}

	@Override
	public int jangTotal(Pager pager) {
		return sql.selectOne("meet.jangtotal", pager);
	}

	@Override
	public int applyTotal(Pager apager) {
		return sql.selectOne("meet.applytotal", apager);
	}
	
}
