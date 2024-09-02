package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kr.co.FiveLastName.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "kr.co.FiveLastName.productMapper";

	@Override
	public List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".pr_selectAll");
	}

	@Override
	public void register(ProductDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace+".pr_insert",dto);
	}

	@Override
	public ProductDTO productOne(int pr_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".pr_selectOne",pr_id);
	}

	@Override
	public void update(int pr_id) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".pr_update",pr_id);
	}

	
}
