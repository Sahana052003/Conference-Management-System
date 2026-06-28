package com.xworkz.delegateOrganizer.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DelegateDTO {
    private Integer id;
    private String Salutation;
    private String name;
    private String registeredEmail;
    private Long mobileNumber;
    private String Designation;
    private String currentLocation;



}
