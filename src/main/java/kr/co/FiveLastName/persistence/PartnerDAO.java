package kr.co.FiveLastName.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PartnerDTO;




@Repository
public interface PartnerDAO {
	List<PartnerDTO> list();
}
