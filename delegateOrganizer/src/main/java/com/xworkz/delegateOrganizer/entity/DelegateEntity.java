package com.xworkz.delegateOrganizer.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.annotation.security.DenyAll;
import javax.persistence.*;

@Entity
@Table(name="delegateLogin_tb")


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DelegateEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    private String Salutation;
    private String name;
    private String registeredEmail;
    private Long mobileNumber;
    private String Designation;
    private String currentLocation;
    private String address;

}
