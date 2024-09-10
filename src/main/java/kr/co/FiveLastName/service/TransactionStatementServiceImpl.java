package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.TransactionStatementDTO;
import kr.co.FiveLastName.persistence.TransactionStatementDAO;

@Service
public class TransactionStatementServiceImpl implements TransactionStatementService {

	@Inject
	TransactionStatementDAO tsDAO;

	@Override
	public List<TransactionStatementDTO> ts_list() {
		// 거래명세서 조회
		return tsDAO.ts_list();
	}

	@Override
	public TransactionStatementDTO ts_selectOne(int ts_num) {
		// 거래명세서 상세 조회
		return tsDAO.ts_selectOne(ts_num);
	}

	@Override
	public int ts_insert(TransactionStatementDTO tsDTO) {
		// 거래명세서 등록
		return tsDAO.ts_insert(tsDTO);
	}

	@Override
	public int ts_update(TransactionStatementDTO tsDTO) {
		// 거래명세서 수정
		return tsDAO.ts_update(tsDTO);
	}
	
	
}
