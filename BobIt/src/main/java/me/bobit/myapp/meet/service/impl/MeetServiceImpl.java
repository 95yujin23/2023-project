package me.bobit.myapp.meet.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertVO;
import me.bobit.myapp.alert.service.impl.AlertDao;
import me.bobit.myapp.meet.service.MeetFileUtils;
import me.bobit.myapp.meet.service.MeetService;
import me.bobit.myapp.meet.service.MeetVO;
import me.bobit.myapp.mtapply.service.MtapplyVO;

@Service
public class MeetServiceImpl implements MeetService {
	
	@Autowired
	private MeetFileUtils fileUtils;
	
	@Autowired
	MeetDao dao;	
	
	@Autowired
	AlertDao adao;
	
	@Override
	public List<MeetVO> selectMeetList(Pager pager) {
		int total = dao.total(pager);

		pager.setTotal(total);
		
		return dao.selectMeetList(pager);
	}

	@Override
	public void insertMeet(MeetVO vo, MeetVO jvo, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.insertMeet(vo);
				
		int jmeetno = dao.selectLastInsertedMeetNo();
		vo.setMeetNo(jmeetno);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size= list.size();
		for(int i=0; i<size; i++) {
			dao.insertMeetImg(list.get(i));
		}
		String jvomemnick = vo.getMemNick();
		
		jvo = new MeetVO();
		jvo.setMeetNo(jmeetno);
		jvo.setMemNick(jvomemnick);
		
		dao.insertMeetJang(jvo);
		
		AlertVO avo = new AlertVO();
		avo.setMemNick(vo.getMemNick());
		String vosj = vo.getMeetSj();
		int vomx = vo.getMeetMax();
		String voar = vo.getMeetArea();
		String acn = "모임 생성이 완료되었습니다. "
						+ "  모임명  : " + vosj 
						+ "  최대모임인원 : " + vomx
						+ "  모임장소 : " + voar 
						+ "  자세한 내용은 내 모임 목록에서 확인 가능합니다.";
		avo.setAlertCn(acn);
		String voaf = "BOBIT";
		avo.setAlertFrom(voaf);
		adao.sendAlert(avo);
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

	@Override
	public void insertMeetJang(MeetVO vo) {
		dao.insertMeetJang(vo);	
	}

	@Override
	public List<MeetVO> selectIndexList() {
		return dao.selectIndexList();
	}

	@Override
	public List<MeetVO> selectMeetJangList(Pager pager) {
		int jangtotal = dao.jangTotal(pager);
		pager.setTotal(jangtotal);
		return dao.selectMeetJangList(pager);
	}

	@Override
	public List<MtapplyVO> selectMeetApplyList(Pager apager) {
		int applytotal = dao.applyTotal(apager);
		apager.setTotal(applytotal);
		return dao.selectMeetApplyList(apager);
	}
	
}
