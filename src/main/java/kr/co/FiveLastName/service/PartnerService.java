package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.PartnerDTO;


@Service
public interface PartnerService {
	List<PartnerDTO> list();
}
