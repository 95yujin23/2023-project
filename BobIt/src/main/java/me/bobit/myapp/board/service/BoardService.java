package me.bobit.myapp.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import me.bobit.myapp.Pager;

public interface BoardService {

	//게시물 목록 가져오기
	List<BoardVO> selectBoardList(Pager pager) throws Exception;
	
	//게시물 상세정보
	BoardVO selectBoard(int boardNo) throws Exception;
	
	//게시물 등록
	void insertBoard(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//게시물 수정하기
	void updateBoard(BoardVO vo) throws Exception;
	
	//게시물 삭제하기
	void deleteBoard(int boardNo) throws Exception;

	//첨부파일 목록 불러오기
	List<AttVO> selectAttList(int boardNo);

	List<Map<String, Object>> selectFileList(int boardNo);
	
	Map<String, Object> selectFile(Map<String, Object> map) throws Exception;
	
	//공지글 작성
	void insertNotice(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	//공지글 리스트
	List<BoardVO> selectNoticeList(Pager pager);
	//공지글 읽기
	BoardVO selectNotice(int boardNo);
	//나의 작성글
	List<BoardVO> myBoard(Pager pager);

}
