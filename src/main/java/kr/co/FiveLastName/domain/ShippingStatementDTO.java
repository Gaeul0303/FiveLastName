package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ShippingStatementDTO {
	
	int sh_id;
	int ss_id;
	Timestamp sh_date;
	
	public ShippingStatementDTO() {
		super();
	}
	
	public ShippingStatementDTO(int sh_id, int ss_id, Timestamp sh_date) {
		super();
		this.sh_id = sh_id;
		this.ss_id = ss_id;
		this.sh_date = sh_date;
	}
	
	public int getSh_id() {
		return sh_id;
	}
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	public int getSs_id() {
		return ss_id;
	}
	public void setSs_id(int ss_id) {
		this.ss_id = ss_id;
	}
	public Timestamp getSh_date() {
		return sh_date;
	}
	public void setSh_date(Timestamp sh_date) {
		this.sh_date = sh_date;
	}
	
	@Override
	public String toString() {
		return "ShippingStatementDTO [sh_id=" + sh_id + ", ss_id=" + ss_id + ", sh_date=" + sh_date + "]";
	}
	
}
