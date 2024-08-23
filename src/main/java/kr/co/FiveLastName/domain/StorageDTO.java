package kr.co.FiveLastName.domain;

public class StorageDTO {
	
	int st_id;
	String st_location;
	String st_name;
	
	public StorageDTO() {
		super();
	}
	
	public StorageDTO(int st_id, String st_location, String st_name) {
		super();
		this.st_id = st_id;
		this.st_location = st_location;
		this.st_name = st_name;
	}

	public int getSt_id() {
		return st_id;
	}

	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}

	public String getSt_location() {
		return st_location;
	}

	public void setSt_location(String st_location) {
		this.st_location = st_location;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	@Override
	public String toString() {
		return "StorageDTO [st_id=" + st_id + ", st_location=" + st_location + ", st_name=" + st_name + "]";
	}
	
	
	
}
