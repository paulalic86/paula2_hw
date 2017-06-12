package com.database;
import java.sql.*;
public class Person {
	//define account variable
	private String Account = "";
	//define password variable
	private String Password = "";

	private String Name = "";

	private String Birth = "";

	private String Email = "";

	private String Phone = "";
	// javabean constructor
	public Person(){

	}
	// set account method
	public void setUserAccount(String account){
		this.Account = account;
	}
	// set password method
	public void setUserPassword(String password){
		this.Password = password;
	}
	// set name method
	public void setName(String name){
		this.Name = name;
	}
	// set birth method
	public void setBirth(String birth){
		this.Birth = birth;
	}
	// set email method
	public void setEmail(String email){
		this.Email = email;
	}
	// set phone method
	public void setPhone(String phone){
		this.Phone = phone;
	}
	// get account method
	public String getUserAccount(){
		return this.Account;
	}
	// get password method
	public String getUserPassword(){
		return this.Password;
	}
	// get name method
	public String getUserName(){
		return this.Name;
	}
	// get birth method
	public String getBirth(){
		return this.Birth;
	}
	// get email method
	public String getUserEmail(){
		return this.Email;
	}
	// get phone method
	public String getUserPhone(){
		return this.Phone;
	}
}
