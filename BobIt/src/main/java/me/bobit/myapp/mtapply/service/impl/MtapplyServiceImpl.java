package me.bobit.myapp.mtapply.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me.bobit.myapp.Pager;
import me.bobit.myapp.alert.service.AlertVO;
import me.bobit.myapp.alert.service.impl.AlertDao;
import me.bobit.myapp.meet.service.MeetVO;
import me.bobit.myapp.mtapply.service.MtapplyService;
import me.bobit.myapp.mtapply.service.MtapplyVO;

@Service
public class MtapplyServiceImpl implements MtapplyService {
	
	@Autowired
	MtapplyDao dao;
	
	@Autowired
	AlertDao adao;
	
	@Override
	public List<MtapplyVO> selectMtapplyList(Pager pager)  throws Exception{
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.selectMtapplyList(pager);
	}

	@Override
	public MtapplyVO selectMtapply(int mtapplyNo)  throws Exception{
		return dao.selectMtapply(mtapplyNo);
	}

	@Override
	public void insertMtapply(MtapplyVO vo, HttpSession session)  throws Exception{
		int existapply = dao.existApply(vo);
		if(existapply == 0) {
		dao.insertMtapply(vo);
		
		AlertVO avo = new AlertVO();
		avo.setMemNick(vo.getMemNick());
		MeetVO meetvo = (MeetVO) session.getAttribute("meetvo");
		String vosj = meetvo.getMeetSj();
		String acn = "모임 신청이 완료되었습니다. " + " 모임명 : " + vosj
							+ " 모임장의 승낙을 기다려주세요.";
		avo.setAlertCn(acn);
		String voaf = "BOBIT";
		avo.setAlertFrom(voaf);
		adao.sendAlert(avo);
		
		AlertVO alvo = new AlertVO();
		alvo.setMemNick(meetvo.getMemNick());
		String alcn = meetvo.getMeetSj() + " 모임에 "
							+ avo.getMemNick() + "님이 참가신청하셨습니다.";
		alvo.setAlertCn(alcn);
		alvo.setAlertFrom(voaf);
		adao.sendAlert(alvo);
		}
		else {
			String alreadyapply = "이미 신청하셨습니다.";
			session.setAttribute("already", alreadyapply);
		}
	}
		
	@Override
	public void agreeMtapply(int mtapplyNo)  throws Exception{
		dao.agreeMtapply(mtapplyNo);
		MtapplyVO mvo = dao.selectMtapply(mtapplyNo);
		AlertVO avo = new AlertVO();
		avo.setMemNick(mvo.getMemNick());
		String acn = "모임명 : " + mvo.getMeetSj() 
							+ "의 참가신청이 승낙되었습니다.";
		avo.setAlertCn(acn);
		String voaf = "BOBIT";
		avo.setAlertFrom(voaf);
		adao.sendAlert(avo);
		
	}

	@Override
	public void deniedMtapply(int mtapplyNo)  throws Exception{
		dao.deniedMtapply(mtapplyNo);
		MtapplyVO mvo = dao.selectMtapply(mtapplyNo);
		AlertVO avo = new AlertVO();
		avo.setMemNick(mvo.getMemNick());
		String acn = "모임명 : " + mvo.getMeetSj() 
							+ "의 참가신청이 거절되었습니다.";
		avo.setAlertCn(acn);
		String voaf = "BOBIT";
		avo.setAlertFrom(voaf);
		adao.sendAlert(avo);
	}

	@Override
	public void waitMtapply(int mtapplyNo)  throws Exception{
		dao.waitMtapply(mtapplyNo);
	}

	@Override
	public List<MtapplyVO> selectMeetApplyList(int meetNo) {
		return dao.selectMeetApplyList(meetNo);
		
	}


	



}
