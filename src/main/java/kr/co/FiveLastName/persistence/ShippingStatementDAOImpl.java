package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ShippingStatementDTO;

@Repository
public class ShippingStatementDAOImpl implements ShippingStatementDAO{
	@Inject
	private SqlSession sqlSession;
	
	private final static String nameSpace = "kr.co.FiveLastName.ShMapper";
	
	@Override
	public int sh_insert(ShippingStatementDTO shDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ShippingStatementDTO> sh_List() {
		// 출하명세서 조회
		return sqlSession.selectList(nameSpace+".sh_List");
	}

	@Override
	public ShippingStatementDTO sh_selectOne(int sh_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sh_update(ShippingStatementDTO shDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
