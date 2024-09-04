package kr.co.FiveLastName.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.DeliveryDTO;
import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private final static String nameSpace = "kr.co.FiveLastName.deliveryMapper";

	@Override
	public List<DeliveryDTO> inventoryList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".inventoryList");
	}

	@Override
	public DeliveryDTO inventorySelectList(int in_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".inventorySelectList", in_id);
	}

	@Override
	public int inventoryUpdate(DeliveryDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".inventoryUpdate", dto);
	}

	@Override
	public int idmInsert(DeliveryDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".idmInsert", dto);
	}

	@Override
	public List<DeliveryDTO> idmReportList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".idmReportList");
	}
	
	
}
