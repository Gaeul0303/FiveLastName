package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProductDTO;
import kr.co.FiveLastName.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO dao;
	
	@Override
	public java.util.List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void register(ProductDTO dto) {
		// TODO Auto-generated method stub
		dao.register(dto);
	}
	
	
	
}
