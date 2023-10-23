package me.bobit.myapp.mtapply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import me.bobit.myapp.Pager;

public interface MtapplyService {

	List<MtapplyVO> selectMtapplyList(Pager pager) throws Exception;

	MtapplyVO selectMtapply(int mtapplyNo) throws Exception;

	void insertMtapply(MtapplyVO vo, HttpSession session) throws Exception;
	
	//승낙
	void agreeMtapply(int mtapplyNo) throws Exception;

	//거절
	void deniedMtapply(int mtapplyNo) throws Exception;
	
	//대기
	void waitMtapply(int mtapplyNo) throws Exception;

	//모임글 선택시 모임번호와 관련된 신청내역 가져오지
	List<MtapplyVO> selectMeetApplyList(int meetNo);

}
