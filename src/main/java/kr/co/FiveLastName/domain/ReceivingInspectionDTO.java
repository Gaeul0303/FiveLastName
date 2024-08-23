package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ReceivingInspectionDTO {
	
	int ri_id; 
	int pi_id; 
	Timestamp ri_date; 
	String ri_availability;
	int ri_totalPrice;
	
	public ReceivingInspectionDTO() {
		super();
	}
	
	public ReceivingInspectionDTO(int ri_id, int pi_id, Timestamp ri_date, String ri_availability, int ri_totalPrice) {
		super();
		this.ri_id = ri_id;
		this.pi_id = pi_id;
		this.ri_date = ri_date;
		this.ri_availability = ri_availability;
		this.ri_totalPrice = ri_totalPrice;
	}
	
	public int getRi_id() {
		return ri_id;
	}
	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
	}
	public int getPi_id() {
		return pi_id;
	}
	public void setPi_id(int pi_id) {
		this.pi_id = pi_id;
	}
	public Timestamp getRi_date() {
		return ri_date;
	}
	public void setRi_date(Timestamp ri_date) {
		this.ri_date = ri_date;
	}
	public String getRi_availability() {
		return ri_availability;
	}
	public void setRi_availability(String ri_availability) {
		this.ri_availability = ri_availability;
	}
	public int getRi_totalPrice() {
		return ri_totalPrice;
	}
	public void setRi_totalPrice(int ri_totalPrice) {
		this.ri_totalPrice = ri_totalPrice;
	}
	
	@Override
	public String toString() {
		return "ReceivingInspectionDTO [ri_id=" + ri_id + ", pi_id=" + pi_id + ", ri_date=" + ri_date
				+ ", ri_availability=" + ri_availability + ", ri_totalPrice=" + ri_totalPrice + "]";
	}
	
	
	
}
