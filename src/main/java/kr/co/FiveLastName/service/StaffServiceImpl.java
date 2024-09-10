package kr.co.FiveLastName.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.StaffDTO;
import kr.co.FiveLastName.persistence.StaffDAO;

@Service
public class StaffServiceImpl implements StaffService{

	@Inject
	private StaffDAO dao;

	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.login(map);
	}


}
