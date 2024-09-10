package kr.co.FiveLastName.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.StaffDTO;

@Service
public interface StaffService {
	//로그인
		Map<String, Object> login(Map<String, Object> map);
}
