package me.bobit.myapp.meet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.meet.service.MeetService;
import me.bobit.myapp.meet.service.MeetVO;

@Service
public class MeetServiceImpl implements MeetService {
	@Autowired
	MeetDao dao;
	
	@Override
	public List<MeetVO> selectMeetList(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectMeetList(pager);
	}

	@Override
	public void insertMeet(MeetVO vo) {
		dao.insertMeet(vo);
	}

	@Override
	public MeetVO selectMeet(int meetNo) {
		return dao.selectMeet(meetNo);
	}

	@Override
	public void updateMeet(MeetVO vo) {
		dao.updateMeet(vo);
	}

	@Override
	public void deleteMeet(int meetNo) {
		dao.deleteMeet(meetNo);
	}

}
