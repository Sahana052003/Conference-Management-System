package com.xworkz.delegateOrganizer.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "delegateRegister_tb")

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DelegateRegisterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;



    private String email;
    private String password;
    private String confirmPassword;
}
