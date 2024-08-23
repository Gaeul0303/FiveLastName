package kr.co.FiveLastName.domain;

public class InventoryDTO {
	
	int in_id;
	String id_code;
	int st_id;
	int in_safetyStock;
	int in_availableInventory;
	int in_physicalInventory;
	String in_status;
	
	public InventoryDTO() {
		super();
	}
	
	public InventoryDTO(int in_id, String id_code, int st_id, int in_safetyStock, int in_availableInventory,
			int in_physicalInventory, String in_status) {
		super();
		this.in_id = in_id;
		this.id_code = id_code;
		this.st_id = st_id;
		this.in_safetyStock = in_safetyStock;
		this.in_availableInventory = in_availableInventory;
		this.in_physicalInventory = in_physicalInventory;
		this.in_status = in_status;
	}
	
	public int getIn_id() {
		return in_id;
	}
	public void setIn_id(int in_id) {
		this.in_id = in_id;
	}
	public String getId_code() {
		return id_code;
	}
	public void setId_code(String id_code) {
		this.id_code = id_code;
	}
	public int getSt_id() {
		return st_id;
	}
	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}
	public int getIn_safetyStock() {
		return in_safetyStock;
	}
	public void setIn_safetyStock(int in_safetyStock) {
		this.in_safetyStock = in_safetyStock;
	}
	public int getIn_availableInventory() {
		return in_availableInventory;
	}
	public void setIn_availableInventory(int in_availableInventory) {
		this.in_availableInventory = in_availableInventory;
	}
	public int getIn_physicalInventory() {
		return in_physicalInventory;
	}
	public void setIn_physicalInventory(int in_physicalInventory) {
		this.in_physicalInventory = in_physicalInventory;
	}
	public String getIn_status() {
		return in_status;
	}
	public void setIn_status(String in_status) {
		this.in_status = in_status;
	}
	
	@Override
	public String toString() {
		return "InventoryDTO [in_id=" + in_id + ", id_code=" + id_code + ", st_id=" + st_id + ", in_safetyStock="
				+ in_safetyStock + ", in_availableInventory=" + in_availableInventory + ", in_physicalInventory="
				+ in_physicalInventory + ", in_status=" + in_status + "]";
	}
	
	
	
}
