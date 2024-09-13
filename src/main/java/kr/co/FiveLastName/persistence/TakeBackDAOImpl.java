package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.TakeBackDTO;

@Repository
public class TakeBackDAOImpl implements TakeBackDAO {
	
	private static final String namespace = "kr.co.FiveLastName.TakeBackMapper";
	
	@Inject
	SqlSession sqlSesseion;

	@Override
	public List<TakeBackDTO> tb_list() {
		// 반품 조회
		return sqlSesseion.selectList(namespace+".tb_list");
	}

	@Override
	public TakeBackDTO tb_selectOne(int tb_code) {
		// 반품 상세 조회
		return sqlSesseion.selectOne(namespace+".tb_selectOne", tb_code);
	}

	@Override
	public int tb_insert(TakeBackDTO tbDTO) {
		// 반품 등록
		return sqlSesseion.insert(namespace+".tb_insert", tbDTO);
	}

	@Override
	public int tb_update(TakeBackDTO tbDTO) {
		// 반품 수정
		return sqlSesseion.update(namespace+".tb_update", tbDTO);
	}

	@Override
	public void tb_delete(int tb_code) throws Exception {
		// 반품 삭제
		sqlSesseion.delete(namespace+".tb_delete");
		
	}
	
	
}
