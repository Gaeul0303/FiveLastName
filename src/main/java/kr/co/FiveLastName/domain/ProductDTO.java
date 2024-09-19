package kr.co.FiveLastName.domain;

public class ProductDTO {
	private int pr_id;
	private String pr_name;
	private String pr_size;
	private String pr_type;
	private String pr_quality;
	private String pr_image;
	private String pr_category;
	private String pr_status;
	private int pr_partner;
	
	public int getPr_partner() {
		return pr_partner;
	}
	public void setPr_partner(int pr_partner) {
		this.pr_partner = pr_partner;
	}
	public ProductDTO() {
		super();
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
	public String getPr_status() {
		return pr_status;
	}

	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}



	@Override
	public String toString() {
		return "ProductDTO [pr_id=" + pr_id + ", pr_name=" + pr_name + ", pr_size=" + pr_size + ", pr_type=" + pr_type
				+ ", pr_quality=" + pr_quality + ", pr_image=" + pr_image + ", pr_category=" + pr_category
				+ ", pr_status=" + pr_status + "]";
	}
	


	
	
}
