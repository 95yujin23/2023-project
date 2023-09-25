package me.bobit.myapp.cdetail.service;

import java.util.List;

import me.bobit.myapp.Pager;

public interface CdetailService {

	//게시물 목록 가져오기
	List<CdetailVO> selectCdetailList(Pager pager) throws Exception;
	
	//게시물 상세정보
	CdetailVO selectCdetail(int cdetailNo) throws Exception;
	
	//게시물 등록
	void insertCdetail(CdetailVO vo) throws Exception;
	
	//게시물 수정하기
	void updateCdetail(CdetailVO vo) throws Exception;
	
	//게시물 삭제하기
	void deleteCdetail(int cdtailNo) throws Exception;
	
}
