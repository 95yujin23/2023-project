package me.bobit.myapp.mtapply.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me.bobit.myapp.Pager;
import me.bobit.myapp.meet.service.MeetVO;
import me.bobit.myapp.mtapply.service.MtapplyVO;

@Repository
public class MtapplyDaoImpl implements MtapplyDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("mtapply.total", pager);
	}

	@Override
	public List<MtapplyVO> selectMtapplyList(Pager pager) {
		return sql.selectList("mtapply.selectmtapplylist", pager);
	}

	@Override
	public MtapplyVO selectMtapply(int mtapplyNo) {
		return sql.selectOne("mtapply.selectmtapply", mtapplyNo);
	}

	@Override
	public void insertMtapply(MtapplyVO vo) {
		sql.insert("mtapply.insertmtapply", vo);
	}

	@Override
	public void agreeMtapply(int mtapplyNo) {
		sql.update("mtapply.agreemtapply", mtapplyNo);

	}

	@Override
	public void deniedMtapply(int mtapplyNo) {
		sql.update("mtapply.deniedmtapply", mtapplyNo);
	}

	@Override
	public void waitMtapply(int mtapplyNo) {
		sql.update("mtapply.waitmtapply", mtapplyNo);
	}

	@Override
	public List<MtapplyVO> selectMeetApplyList(int meetNo) {
		return sql.selectList("mtapply.selectmeetapplylist", meetNo);
	}

	@Override
	public int existApply(MtapplyVO vo) {
		return sql.selectOne("mtapply.existapply", vo);
	}

	

	


}
