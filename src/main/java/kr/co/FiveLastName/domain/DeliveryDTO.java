package kr.co.FiveLastName.domain;

import java.sql.Timestamp;

public class DeliveryDTO {
	
	int idm_id;
	int in_id;
	Timestamp idm_date;
	int idm_quantity;
	String idm_status;
	int pr_id;
	String pr_name;
	String pr_size;
	String pr_type;
	String pr_quality;
	String pr_image;
	String pr_category;
	String id_code;
	int st_id;
	int in_safetyStock;
	int in_availableInventory;
	int in_physicalInventory;
	String in_status;
	String ri_date;
	int co_supplyPrice;
	
	public DeliveryDTO() {
		super();
	}

	public DeliveryDTO(int idm_id, int in_id, Timestamp idm_date, int idm_quantity, String idm_status, int pr_id,
			String pr_name, String pr_size, String pr_type, String pr_quality, String pr_image, String pr_category,
			String id_code, int st_id, int in_safetyStock, int in_availableInventory, int in_physicalInventory,
			String in_status, String ri_date, int co_supplyPrice) {
		super();
		this.idm_id = idm_id;
		this.in_id = in_id;
		this.idm_date = idm_date;
		this.idm_quantity = idm_quantity;
		this.idm_status = idm_status;
		this.pr_id = pr_id;
		this.pr_name = pr_name;
		this.pr_size = pr_size;
		this.pr_type = pr_type;
		this.pr_quality = pr_quality;
		this.pr_image = pr_image;
		this.pr_category = pr_category;
		this.id_code = id_code;
		this.st_id = st_id;
		this.in_safetyStock = in_safetyStock;
		this.in_availableInventory = in_availableInventory;
		this.in_physicalInventory = in_physicalInventory;
		this.in_status = in_status;
		this.ri_date = ri_date;
		this.co_supplyPrice = co_supplyPrice;
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

	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public String getPr_size() {
		return pr_size;
	}

	public void setPr_size(String pr_size) {
		this.pr_size = pr_size;
	}

	public String getPr_type() {
		return pr_type;
	}

	public void setPr_type(String pr_type) {
		this.pr_type = pr_type;
	}

	public String getPr_quality() {
		return pr_quality;
	}

	public void setPr_quality(String pr_quality) {
		this.pr_quality = pr_quality;
	}

	public String getPr_image() {
		return pr_image;
	}

	public void setPr_image(String pr_image) {
		this.pr_image = pr_image;
	}

	public String getPr_category() {
		return pr_category;
	}

	public void setPr_category(String pr_category) {
		this.pr_category = pr_category;
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

	public String getRi_date() {
		return ri_date;
	}

	public void setRi_date(String ri_date) {
		this.ri_date = ri_date;
	}

	public int getCo_supplyPrice() {
		return co_supplyPrice;
	}

	public void setCo_supplyPrice(int co_supplyPrice) {
		this.co_supplyPrice = co_supplyPrice;
	}

	@Override
	public String toString() {
		return "DeliveryDTO [idm_id=" + idm_id + ", in_id=" + in_id + ", idm_date=" + idm_date + ", idm_quantity="
				+ idm_quantity + ", idm_status=" + idm_status + ", pr_id=" + pr_id + ", pr_name=" + pr_name
				+ ", pr_size=" + pr_size + ", pr_type=" + pr_type + ", pr_quality=" + pr_quality + ", pr_image="
				+ pr_image + ", pr_category=" + pr_category + ", id_code=" + id_code + ", st_id=" + st_id
				+ ", in_safetyStock=" + in_safetyStock + ", in_availableInventory=" + in_availableInventory
				+ ", in_physicalInventory=" + in_physicalInventory + ", in_status=" + in_status + ", ri_date=" + ri_date
				+ ", co_supplyPrice=" + co_supplyPrice + "]";
	}

	
	
	
	
	
	
	
	
}
