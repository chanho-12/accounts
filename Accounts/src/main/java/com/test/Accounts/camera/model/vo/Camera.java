package com.test.Accounts.camera.model.vo;

import java.sql.Date;

public class Camera implements java.io.Serializable{

	private static final long serialVersionUID = 8286042927259174249L;
	private int camera_num;
	private String camera_storename;
	private int camera_total;
	private Date camera_date;
	private String user_id;
	private String original_filepath;
	private String rename_filepath;
	private int product_no;
	private String product_name;
	private int product_count;
	private int unit_price;
	private int product_price;




	
	public Camera() {
		super();
	}











	public Camera(int camera_num, String camera_storename, int camera_total, Date camera_date, String user_id,
			String original_filepath, String rename_filepath, int product_no, String product_name, int product_count,
			int unit_price, int product_price) {
		super();
		this.camera_num = camera_num;
		this.camera_storename = camera_storename;
		this.camera_total = camera_total;
		this.camera_date = camera_date;
		this.user_id = user_id;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_count = product_count;
		this.unit_price = unit_price;
		this.product_price = product_price;
	}





	public Camera(int camera_num, String camera_storename, int camera_total, Date camera_date, String user_id,
			String original_filepath, String rename_filepath) {
		super();
		this.camera_num = camera_num;
		this.camera_storename = camera_storename;
		this.camera_total = camera_total;
		this.camera_date = camera_date;
		this.user_id = user_id;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
	}





	public Camera(int camera_num, int product_no, String product_name, int product_count, int unit_price, int product_price) {
		super();
		this.camera_num = camera_num;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_count = product_count;
		this.unit_price = unit_price;
		this.product_price = product_price;
	}











	public int getCamera_num() {
		return camera_num;
	}











	public void setCamera_num(int camera_num) {
		this.camera_num = camera_num;
	}











	public String getCamera_storename() {
		return camera_storename;
	}











	public void setCamera_storename(String camera_storename) {
		this.camera_storename = camera_storename;
	}











	public int getCamera_total() {
		return camera_total;
	}











	public void setCamera_total(int camera_total) {
		this.camera_total = camera_total;
	}











	public Date getCamera_date() {
		return camera_date;
	}











	public void setCamera_date(Date camera_date) {
		this.camera_date = camera_date;
	}











	public String getUser_id() {
		return user_id;
	}











	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}











	public String getOriginal_filepath() {
		return original_filepath;
	}











	public void setOriginal_filepath(String original_filepath) {
		this.original_filepath = original_filepath;
	}











	public String getRename_filepath() {
		return rename_filepath;
	}











	public void setRename_filepath(String rename_filepath) {
		this.rename_filepath = rename_filepath;
	}











	public int getProduct_no() {
		return product_no;
	}











	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}











	public String getProduct_name() {
		return product_name;
	}











	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}











	public int getProduct_count() {
		return product_count;
	}











	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}











	public int getUnit_price() {
		return unit_price;
	}











	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}











	public int getProduct_price() {
		return product_price;
	}











	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}











	public static long getSerialversionuid() {
		return serialVersionUID;
	}











	@Override
	public String toString() {
		return "Camera [camera_num=" + camera_num + ", camera_storename=" + camera_storename + ", camera_total="
				+ camera_total + ", camera_date=" + camera_date + ", user_id=" + user_id + ", original_filepath="
				+ original_filepath + ", rename_filepath=" + rename_filepath + ", product_no=" + product_no
				+ ", product_name=" + product_name + ", product_count=" + product_count + ", unit_price="
				+ unit_price + ", product_price=" + product_price + "]";
	}






	
	
	
	
	
}
