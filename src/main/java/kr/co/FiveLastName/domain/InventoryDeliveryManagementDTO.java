package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class InventoryDeliveryManagementDTO {
	
	int idm_id;
	int in_id;
	Timestamp idm_date;
	int idm_quantity;
	String idm_status;
	
	
	
	public InventoryDeliveryManagementDTO() {
		super();
	}
	public InventoryDeliveryManagementDTO(int idm_id, int in_id, Timestamp idm_date, int idm_quantity,
			String idm_status) {
		super();
		this.idm_id = idm_id;
		this.in_id = in_id;
		this.idm_date = idm_date;
		this.idm_quantity = idm_quantity;
		this.idm_status = idm_status;
	}
	public int getIdm_id() {
		return idm_id;
	}
	public void setIdm_id(int idm_id) {
		this.idm_id = idm_id;
	}
	public int getIn_id() {
		return in_id;
	}
	public void setIn_id(int in_id) {
		this.in_id = in_id;
	}
	public Timestamp getIdm_date() {
		return idm_date;
	}
	public void setIdm_date(Timestamp idm_date) {
		this.idm_date = idm_date;
	}
	public int getIdm_quantity() {
		return idm_quantity;
	}
	public void setIdm_quantity(int idm_quantity) {
		this.idm_quantity = idm_quantity;
	}
	public String getIdm_status() {
		return idm_status;
	}
	public void setIdm_status(String idm_status) {
		this.idm_status = idm_status;
	}
	@Override
	public String toString() {
		return "InventoryDeliveryManagementDTO [idm_id=" + idm_id + ", in_id=" + in_id + ", idm_date=" + idm_date
				+ ", idm_quantity=" + idm_quantity + ", idm_status=" + idm_status + "]";
	}
	
	
	
}
