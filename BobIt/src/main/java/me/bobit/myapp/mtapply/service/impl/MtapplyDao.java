package me.bobit.myapp.mtapply.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.mtapply.service.MtapplyVO;

public interface MtapplyDao {
	
	int total(Pager pager);

	List<MtapplyVO> selectMtapplyList(Pager pager);

	MtapplyVO selectMtapply(int mtapplyNo);

	void insertMtapply(MtapplyVO vo);

	void agreeMtapply(int mtapplyNo);

	void deniedMtapply(int mtapplyNo);

	void waitMtapply(int mtapplyNo);

	List<MtapplyVO> selectMeetApplyList(int meetNo);

	int existApply(MtapplyVO vo);



}
