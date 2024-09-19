package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.IncomingDeadlineDTO;
import kr.co.FiveLastName.persistence.IncomingDeadlineDAO;

@Service
public class IncomingDeadlineServiceImpl implements IncomingDeadlineService{

	@Inject
	IncomingDeadlineDAO idDAO;
	
	@Override
	public List<IncomingDeadlineDTO> id_list() {
		// 입고마감 전체 조회
		return idDAO.id_list();
	}

	@Override
	public IncomingDeadlineDTO id_selectOne(String id_code) {
		// 입고마감 상세 조회
		return idDAO.id_selectOne(id_code);
	}

	@Override
	public int id_insert(IncomingDeadlineDTO idDTO) {
		// 입고마감 등록
		return idDAO.id_insert(idDTO);
	}

	@Override
	public IncomingDeadlineDTO id_update(IncomingDeadlineDTO idDTO) {
		// 입고마감 수정
		return idDAO.id_update(idDTO);
	}

	@Override
	public void id_delete(String id_code) throws Exception {
		// 입고마감 삭제
		idDAO.id_delete(id_code);
		
	}

}
