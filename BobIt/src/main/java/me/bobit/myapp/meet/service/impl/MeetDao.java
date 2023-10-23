package me.bobit.myapp.meet.service.impl;

import java.util.List;
import java.util.Map;

import me.bobit.myapp.Pager;
import me.bobit.myapp.mtapply.service.MtapplyVO;
import me.bobit.myapp.meet.service.MeetVO;

public interface MeetDao {

	int total(Pager pager);

	List<MeetVO> selectMeetList(Pager pager);

	MeetVO selectMeet(int meetNo);

	void insertMeet(MeetVO vo);

	void updateMeet(MeetVO vo);

	void deleteMeet(int meetNo);

	void insertMeetJang(MeetVO jvo);
	
	int selectLastInsertedMeetNo();

	void insertMeetImg(Map<String, Object> map);

	List<MeetVO> selectIndexList();

	List<MeetVO> selectMeetJangList(Pager pager);

	List<MtapplyVO> selectMeetApplyList(Pager pager);

	int jangTotal(Pager pager);

	int applyTotal(Pager apager);

	
}
