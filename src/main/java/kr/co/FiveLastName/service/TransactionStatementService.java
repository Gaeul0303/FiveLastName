package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.TransactionStatementDTO;

@Service
public interface TransactionStatementService {
	// 거래명세서 조회
		public List<TransactionStatementDTO> ts_list();
		
		public List<TransactionStatementDTO> ts_selectList(String id_code);
		
//		거래명세서 상세 조회
		public TransactionStatementDTO ts_selectOne(String ts_num);
		
//		거래명세서 등록
		public int ts_insert(TransactionStatementDTO tsDTO);
		
//		거래명세서 수정
		public int ts_update(TransactionStatementDTO tsDTO);
}
