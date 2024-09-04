package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class PurchaseOrderDTO {
	
	int po_id;
	int ppr_id;
	Timestamp po_regDate;
	String po_status;
	
	public PurchaseOrderDTO() {
		super();
	}
	
	
	public PurchaseOrderDTO(int po_id, int ppr_id, Timestamp po_regDate, String po_status) {
		super();
		this.po_id = po_id;
		this.ppr_id = ppr_id;
		this.po_regDate = po_regDate;
		this.po_status = po_status;
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

	public Timestamp getPo_regDate() {
		return po_regDate;
	}

	public void setPo_regDate(Timestamp po_regDate) {
		this.po_regDate = po_regDate;
	}

	public String getPo_status() {
		return po_status;
	}

	public void setPo_status(String po_status) {
		this.po_status = po_status;
	}


	@Override
	public String toString() {
		return "PurchaseOrderDTO [po_id=" + po_id + ", ppr_id=" + ppr_id + ", po_regDate=" + po_regDate + ", po_status="
				+ po_status + "]";
	}
	
	
	
}
