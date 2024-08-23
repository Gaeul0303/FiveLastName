package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class PurchaseOrderDTO {
	
	int po_id;
	int ppr_id;
	Timestamp po_modificationDate;
	
	public PurchaseOrderDTO() {
		super();
	}

	public PurchaseOrderDTO(int po_id, int ppr_id, Timestamp po_modificationDate) {
		super();
		this.po_id = po_id;
		this.ppr_id = ppr_id;
		this.po_modificationDate = po_modificationDate;
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

	public Timestamp getPo_modificationDate() {
		return po_modificationDate;
	}

	public void setPo_modificationDate(Timestamp po_modificationDate) {
		this.po_modificationDate = po_modificationDate;
	}

	@Override
	public String toString() {
		return "PurchaseOrderDTO [po_id=" + po_id + ", ppr_id=" + ppr_id + ", po_modificationDate="
				+ po_modificationDate + "]";
	}
	
}
