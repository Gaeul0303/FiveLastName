package kr.co.FiveLastName.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;
import kr.co.FiveLastName.domain.PrintPODTO;

@Repository
public class PrintPODAOImpl implements PrintPODAO{

	@Autowired
	private SqlSession sqlSession;
	
	private final static String nameSpace = "kr.co.FiveLastName.printPOMapper";

	@Override
	public PrintPODTO selectPO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrintPODTO> listPO() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
