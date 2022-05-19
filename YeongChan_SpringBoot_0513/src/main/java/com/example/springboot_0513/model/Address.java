package com.example.springboot_0513.model;

import javax.persistence.Embeddable;

@Embeddable
public class Address {
	private String zipcode;
	private String address1;
	private String address2;
}
