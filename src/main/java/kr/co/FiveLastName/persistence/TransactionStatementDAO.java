package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.TransactionStatementDTO;

public interface TransactionStatementDAO {
// 거래명세서 조회
	public List<TransactionStatementDTO> ts_list();
	
//	거래명세서 상세 조회
	public TransactionStatementDTO ts_selectOne(int ts_num);
	
//	거래명세서 등록
	public int ts_insert(TransactionStatementDTO tsDTO);
	
//	거래명세서 수정
	public int ts_update(TransactionStatementDTO tsDTO);
	
}
