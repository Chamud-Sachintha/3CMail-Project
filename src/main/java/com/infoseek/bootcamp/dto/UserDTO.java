package com.infoseek.bootcamp.dto;

public class UserDTO {
	
	private String username;
	private String address;
	private String contactNumber;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username + "@3cmail.com";
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "UserDTO [username=" + username + ", address=" + address + ", contactNumber=" + contactNumber
				+ ", password=" + password + "]";
	}
}
