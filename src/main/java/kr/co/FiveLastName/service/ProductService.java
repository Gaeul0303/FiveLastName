package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProductDTO;

@Service
public interface ProductService {
	void register(ProductDTO dto);
	
	List<ProductDTO> list();
	
	ProductDTO productOne(int pr_id);
	
	void modify(int pr_id);
}
