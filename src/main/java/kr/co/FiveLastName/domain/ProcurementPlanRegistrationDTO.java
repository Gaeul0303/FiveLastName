package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class ProcurementPlanRegistrationDTO {
	
	int ppr_id;
	int co_id;
	Timestamp ppr_dueDate;
	int ppr_quantity;
	
	public ProcurementPlanRegistrationDTO() {
		super();
	}

	public ProcurementPlanRegistrationDTO(int ppr_id, int co_id, Timestamp ppr_dueDate, int ppr_quantity) {
		super();
		this.ppr_id = ppr_id;
		this.co_id = co_id;
		this.ppr_dueDate = ppr_dueDate;
		this.ppr_quantity = ppr_quantity;
	}

	public int getPpr_id() {
		return ppr_id;
	}

	public void setPpr_id(int ppr_id) {
		this.ppr_id = ppr_id;
	}

	public int getCo_id() {
		return co_id;
	}

	public void setCo_id(int co_id) {
		this.co_id = co_id;
	}

	public Timestamp getPpr_dueDate() {
		return ppr_dueDate;
	}

	public void setPpr_dueDate(Timestamp ppr_dueDate) {
		this.ppr_dueDate = ppr_dueDate;
	}

	public int getPpr_quantity() {
		return ppr_quantity;
	}

	public void setPpr_quantity(int ppr_quantity) {
		this.ppr_quantity = ppr_quantity;
	}

	@Override
	public String toString() {
		return "ProcurementPlanRegistrationDTO [ppr_id=" + ppr_id + ", co_id=" + co_id + ", ppr_dueDate=" + ppr_dueDate
				+ ", ppr_quantity=" + ppr_quantity + "]";
	}
	
	
	
}
