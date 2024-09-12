package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class IncomingDeadlineDTO {
	
	private String id_code;
	private int ri_id;
	private int id_genuineNum;
	private int id_totalPirce;
	private int pa_name;
	private String pr_name;
	private int pi_inspectedQuantity;
	private String pi_status;
	private int co_supplyPrice;
	private String ri_availability;
	private int ri_totalPrice;
	private Timestamp ri_date;
	
	public IncomingDeadlineDTO() {
		super();
	}
	
	public IncomingDeadlineDTO(String id_code, int ri_id, int id_genuineNum, int id_totalPirce, int pa_name,
			String pr_name, int pi_inspectedQuantity, String pi_status, int co_supplyPrice, String ri_availability,
			int ri_totalPrice, Timestamp ri_date) {
		super();
		this.id_code = id_code;
		this.ri_id = ri_id;
		this.id_genuineNum = id_genuineNum;
		this.id_totalPirce = id_totalPirce;
		this.pa_name = pa_name;
		this.pr_name = pr_name;
		this.pi_inspectedQuantity = pi_inspectedQuantity;
		this.pi_status = pi_status;
		this.co_supplyPrice = co_supplyPrice;
		this.ri_availability = ri_availability;
		this.ri_totalPrice = ri_totalPrice;
		this.ri_date = ri_date;
	}

	public String getId_code() {
		return id_code;
	}

	public void setId_code(String id_code) {
		this.id_code = id_code;
	}

	public int getRi_id() {
		return ri_id;
	}

	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
	}

	public int getId_genuineNum() {
		return id_genuineNum;
	}

	public void setId_genuineNum(int id_genuineNum) {
		this.id_genuineNum = id_genuineNum;
	}

	public int getId_totalPirce() {
		return id_totalPirce;
	}

	public void setId_totalPirce(int id_totalPirce) {
		this.id_totalPirce = id_totalPirce;
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

	public Timestamp getRi_date() {
		return ri_date;
	}

	public void setRi_date(Timestamp ri_date) {
		this.ri_date = ri_date;
	}

	@Override
	public String toString() {
		return "IncomingDeadlineDTO [id_code=" + id_code + ", ri_id=" + ri_id + ", id_genuineNum=" + id_genuineNum
				+ ", id_totalPirce=" + id_totalPirce + ", pa_name=" + pa_name + ", pr_name=" + pr_name
				+ ", pi_inspectedQuantity=" + pi_inspectedQuantity + ", pi_status=" + pi_status + ", co_supplyPrice="
				+ co_supplyPrice + ", ri_availability=" + ri_availability + ", ri_totalPrice=" + ri_totalPrice
				+ ", ri_date=" + ri_date + "]";
	}

		
}
