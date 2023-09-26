package me.bobit.myapp.meet.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface MeetService {

	List<MeetVO> selectMeetList(Pager pager);

	void insertMeet(MeetVO vo);

	MeetVO selectMeet(int meetNo);

	void updateMeet(MeetVO vo);

	void deleteMeet(int meetNo);

}
