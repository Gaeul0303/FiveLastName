package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.TransactionStatementDTO;

@Repository
public class TransactionStatementDAOImpl implements TransactionStatementDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "kr.co.FiveLastName.TsMapper";
	
	@Override
	public List<TransactionStatementDTO> ts_list() {
		// 거래명세서 조회
		return sqlSession.selectList(namespace+".ts_list");
	}
	@Override
	public TransactionStatementDTO ts_selectOne(int ts_num) {
		// 거래명세서 상세 조회
		return sqlSession.selectOne(namespace+".ts_selectOne", ts_num);
	}
	@Override
	public int ts_insert(TransactionStatementDTO tsDTO) {
		// 거래명세서 등록
		return sqlSession.insert(namespace+".ts_insert", tsDTO);
	}
	@Override
	public int ts_update(TransactionStatementDTO tsDTO) {
		// 거래명세서 수정
		return sqlSession.update(namespace+".ts_update", tsDTO);
	}
	
	
}
