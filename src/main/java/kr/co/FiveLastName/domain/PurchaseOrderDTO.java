package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class PurchaseOrderDTO {
	
	int po_id;
	int ppr_id;
	Timestamp po_regDate;
	
	public PurchaseOrderDTO() {
		super();
	}

	public PurchaseOrderDTO(int po_id, int ppr_id, Timestamp po_regDate) {
		super();
		this.po_id = po_id;
		this.ppr_id = ppr_id;
		this.po_regDate = po_regDate;
	}

	public int getPo_id() {
		return po_id;
	}

	public void setPo_id(int po_id) {
		this.po_id = po_id;
	}

	public int getPpr_id() {
		return ppr_id;
	}

	public void setPpr_id(int ppr_id) {
		this.ppr_id = ppr_id;
	}

	public Timestamp getpo_regDate() {
		return po_regDate;
	}

	public void setpo_regDate(Timestamp po_regDate) {
		this.po_regDate = po_regDate;
	}

	@Override
	public String toString() {
		return "PurchaseOrderDTO [po_id=" + po_id + ", ppr_id=" + ppr_id + ", po_regDate="
				+ po_regDate + "]";
	}
	
}
