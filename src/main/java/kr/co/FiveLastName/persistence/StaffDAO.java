package kr.co.FiveLastName.persistence;

import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface StaffDAO {

	//로그인
	Map<String, Object> login(Map<String, Object> map);
}
