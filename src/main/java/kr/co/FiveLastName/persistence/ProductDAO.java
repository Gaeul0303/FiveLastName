package kr.co.FiveLastName.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;


import kr.co.FiveLastName.domain.ProductDTO;

@Repository
public interface ProductDAO {

	void register(ProductDTO dto);
	
	List<ProductDTO> list();
	
	ProductDTO productOne(int pr_id);

	void update(ProductDTO dto);
}
