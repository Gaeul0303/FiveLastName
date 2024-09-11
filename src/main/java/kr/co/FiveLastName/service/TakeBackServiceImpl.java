package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.TakeBackDTO;
import kr.co.FiveLastName.persistence.TakeBackDAO;

@Service
public class TakeBackServiceImpl implements TakeBackService {
	
	@Inject
	TakeBackDAO tbDAO;

	@Override
	public List<TakeBackDTO> tb_list() {
		// 반품 조회
		return tbDAO.tb_list();
	}

	@Override
	public TakeBackDTO tb_selectOne(int tb_code) {
		// 반품 상세 조회
		return tbDAO.tb_selectOne(tb_code);
	}

	@Override
	public int tb_insert(TakeBackDTO tbDTO) {
		// 반품 등록
		return tbDAO.tb_insert(tbDTO);
	}

	@Override
	public int tb_update(TakeBackDTO tbDTO) {
		// 반품 수정
		return tbDAO.tb_update(tbDTO);
	}
}
