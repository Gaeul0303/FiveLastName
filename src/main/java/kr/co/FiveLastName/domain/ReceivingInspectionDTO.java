package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ReceivingInspectionDTO {
	
	private int ri_id; 
	private int pi_id; 
	private Timestamp ri_date; 
	private String ri_availability;
	private int ri_totalPrice;
	private int pa_name;
	private String pr_name;
	private int pi_inspectedQuantity;
	private String pi_status;
	private int co_supplyPrice;
	
	public ReceivingInspectionDTO() {
		super();
	}
	
	public ReceivingInspectionDTO(int ri_id, int pi_id, Timestamp ri_date, String ri_availability, int ri_totalPrice,
			int pa_name, String pr_name, int pi_inspectedQuantity, String pi_status, int co_supplyPrice) {
		super();
		this.ri_id = ri_id;
		this.pi_id = pi_id;
		this.ri_date = ri_date;
		this.ri_availability = ri_availability;
		this.ri_totalPrice = ri_totalPrice;
		this.pa_name = pa_name;
		this.pr_name = pr_name;
		this.pi_inspectedQuantity = pi_inspectedQuantity;
		this.pi_status = pi_status;
		this.co_supplyPrice = co_supplyPrice;
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

	public int getPa_name() {
		return pa_name;
	}

	public void setPa_name(int pa_name) {
		this.pa_name = pa_name;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getPi_inspectedQuantity() {
		return pi_inspectedQuantity;
	}

	public void setPi_inspectedQuantity(int pi_inspectedQuantity) {
		this.pi_inspectedQuantity = pi_inspectedQuantity;
	}

	public String getPi_status() {
		return pi_status;
	}

	public void setPi_status(String pi_status) {
		this.pi_status = pi_status;
	}

	public int getCo_supplyPrice() {
		return co_supplyPrice;
	}

	public void setCo_supplyPrice(int co_supplyPrice) {
		this.co_supplyPrice = co_supplyPrice;
	}

	@Override
	public String toString() {
		return "ReceivingInspectionDTO [ri_id=" + ri_id + ", pi_id=" + pi_id + ", ri_date=" + ri_date
				+ ", ri_availability=" + ri_availability + ", ri_totalPrice=" + ri_totalPrice + ", pa_name=" + pa_name
				+ ", pr_name=" + pr_name + ", pi_inspectedQuantity=" + pi_inspectedQuantity + ", pi_status=" + pi_status
				+ ", co_supplyPrice=" + co_supplyPrice + "]";
	}

			
}