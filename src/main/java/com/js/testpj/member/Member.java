package com.js.testpj.member;

import java.util.Date;

public class Member {

	private String custom_user_name;
	private String custom_user_birth;
	private String custom_user_nick;
	private String custom_user_email;
	private String custom_user_address;
	private String custom_user_phone;
	private String custom_user_pswd;
	private String custom_user_auth;
	private String custom_user_del_yn;
	private Date custom_user_reg_date;
	private Date custom_user_mod_date;
	
	
	public Member() {
		// TODO Auto-generated constructor stub
	}


	public Member(String custom_user_name, String custom_user_birth, String custom_user_nick, String custom_user_email,
			String custom_user_address, String custom_user_phone, String custom_user_pswd, String custom_user_auth,
			String custom_user_del_yn, Date custom_user_reg_date, Date custom_user_mod_date) {
		super();
		this.custom_user_name = custom_user_name;
		this.custom_user_birth = custom_user_birth;
		this.custom_user_nick = custom_user_nick;
		this.custom_user_email = custom_user_email;
		this.custom_user_address = custom_user_address;
		this.custom_user_phone = custom_user_phone;
		this.custom_user_pswd = custom_user_pswd;
		this.custom_user_auth = custom_user_auth;
		this.custom_user_del_yn = custom_user_del_yn;
		this.custom_user_reg_date = custom_user_reg_date;
		this.custom_user_mod_date = custom_user_mod_date;
	}


	public String getCustom_user_name() {
		return custom_user_name;
	}


	public void setCustom_user_name(String custom_user_name) {
		this.custom_user_name = custom_user_name;
	}


	public String getCustom_user_birth() {
		return custom_user_birth;
	}


	public void setCustom_user_birth(String custom_user_birth) {
		this.custom_user_birth = custom_user_birth;
	}


	public String getCustom_user_nick() {
		return custom_user_nick;
	}


	public void setCustom_user_nick(String custom_user_nick) {
		this.custom_user_nick = custom_user_nick;
	}


	public String getCustom_user_email() {
		return custom_user_email;
	}


	public void setCustom_user_email(String custom_user_email) {
		this.custom_user_email = custom_user_email;
	}


	public String getCustom_user_address() {
		return custom_user_address;
	}


	public void setCustom_user_address(String custom_user_address) {
		this.custom_user_address = custom_user_address;
	}


	public String getCustom_user_phone() {
		return custom_user_phone;
	}


	public void setCustom_user_phone(String custom_user_phone) {
		this.custom_user_phone = custom_user_phone;
	}


	public String getCustom_user_pswd() {
		return custom_user_pswd;
	}


	public void setCustom_user_pswd(String custom_user_pswd) {
		this.custom_user_pswd = custom_user_pswd;
	}


	public String getCustom_user_auth() {
		return custom_user_auth;
	}


	public void setCustom_user_auth(String custom_user_auth) {
		this.custom_user_auth = custom_user_auth;
	}


	public String getCustom_user_del_yn() {
		return custom_user_del_yn;
	}


	public void setCustom_user_del_yn(String custom_user_del_yn) {
		this.custom_user_del_yn = custom_user_del_yn;
	}


	public Date getCustom_user_reg_date() {
		return custom_user_reg_date;
	}


	public void setCustom_user_reg_date(Date custom_user_reg_date) {
		this.custom_user_reg_date = custom_user_reg_date;
	}


	public Date getCustom_user_mod_date() {
		return custom_user_mod_date;
	}


	public void setCustom_user_mod_date(Date custom_user_mod_date) {
		this.custom_user_mod_date = custom_user_mod_date;
	}


	
	
}
