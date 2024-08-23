package kr.co.FiveLastName.domain;

public class OrderStatusDTO {
	
	String os_code;
	String id_code;
	String os_status;
	
	public OrderStatusDTO() {
		super();
	}
	
	public OrderStatusDTO(String os_code, String id_code, String os_status) {
		super();
		this.os_code = os_code;
		this.id_code = id_code;
		this.os_status = os_status;
	}

	public String getOs_code() {
		return os_code;
	}

	public void setOs_code(String os_code) {
		this.os_code = os_code;
	}

	public String getId_code() {
		return id_code;
	}

	public void setId_code(String id_code) {
		this.id_code = id_code;
	}

	public String getOs_status() {
		return os_status;
	}

	public void setOs_status(String os_status) {
		this.os_status = os_status;
	}

	@Override
	public String toString() {
		return "OrderStatusDTO [os_code=" + os_code + ", id_code=" + id_code + ", os_status=" + os_status + "]";
	}
	
	
	
}
