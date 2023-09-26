package me.bobit.myapp.meet.service.impl;

import java.util.List;

import me.bobit.myapp.Pager;
import me.bobit.myapp.meet.service.MeetVO;

public interface MeetDao {

	int total(Pager pager);

	List<MeetVO> selectMeetList(Pager pager);

	MeetVO selectMeet(int meetNo);

	void insertMeet(MeetVO vo);

	void updateMeet(MeetVO vo);

	void deleteMeet(int meetNo);

}
