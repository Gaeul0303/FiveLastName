package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.IncomingDeadlineDTO;

public interface IncomingDeadlineDAO {
//	입고마감 조회
	public List<IncomingDeadlineDTO> id_list();
	
//	입고마감 상세 조회
	public IncomingDeadlineDTO id_selectOne(String id_code);
	
//	입고마감 등록
	public IncomingDeadlineDTO id_insert(IncomingDeadlineDTO idDTO);
	
//	입고마감 수정
	public IncomingDeadlineDTO id_update(IncomingDeadlineDTO idDTO);
}
