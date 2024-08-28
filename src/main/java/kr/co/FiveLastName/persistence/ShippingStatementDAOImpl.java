package kr.co.FiveLastName.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ShippingStatementDTO;

@Repository
public class ShippingStatementDAOImpl implements ShippingStatementDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private final static String nameSpace = "kr.co.FiveLastName.mapper";
	
	@Override
	public List<ShippingStatementDTO> shList() {
		// 출하명세서 전체 조회
		return sqlSession.selectList(nameSpace+".");
	}

	@Override
	public ShippingStatementDTO shDTO(int sh_id) {
		// 출하명세서 선택 조회
		return null;
	}

	@Override
	public int update(ShippingStatementDTO shDTO) {
		// 출하명세서 수정
		return 0;
	}

	@Override
	public int delete(int sh_id) {
		// 출하명세서 삭제
		return 0;
	}

}
