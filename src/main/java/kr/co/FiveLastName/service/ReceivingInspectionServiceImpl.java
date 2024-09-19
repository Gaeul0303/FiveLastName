package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;
import kr.co.FiveLastName.persistence.ReceivingInspectionDAO;

@Service
public class ReceivingInspectionServiceImpl implements ReceivingInspectionService {
	
	@Inject
	ReceivingInspectionDAO riDAO;

	@Override
	public List<ReceivingInspectionDTO> ri_list() {
		// 조회
		return riDAO.ri_list();
	}

	@Override
	public ReceivingInspectionDTO ri_selectOne(int ri_id) {
		// 상세조회
		return riDAO.ri_selectOne(ri_id);
	}

	@Override
	public ReceivingInspectionDTO ri_insert(ReceivingInspectionDTO riDTO) {
		// 등록
		return riDAO.ri_insert(riDTO);
	}

	@Override
	public ReceivingInspectionDTO ri_update(ReceivingInspectionDTO riDTO) {
		// 수정
		return riDAO.ri_update(riDTO);
	}

	@Override
	public void ri_delete(int ri_id) throws Exception {
		// 삭제
		riDAO.ri_delete(ri_id);
		
	}
	
	
}
