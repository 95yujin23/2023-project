package me.bobit.myapp.meet.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.mtapply.service.MtapplyVO;

public interface MeetService {

	List<MeetVO> selectMeetList(Pager pager);

	void insertMeet(MeetVO vo, MeetVO jvo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	MeetVO selectMeet(int meetNo);

	void updateMeet(MeetVO vo);

	void deleteMeet(int meetNo);

	void insertMeetJang(MeetVO jvo);

	List<MeetVO> selectIndexList();
	
	//나의 모임용, 내가 모임장인거
	List<MeetVO> selectMeetJangList(Pager pager);
	//나의 모임용, 내가 신청자인거
	List<MtapplyVO> selectMeetApplyList(Pager apager);
}
