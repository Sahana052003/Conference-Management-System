package com.xworkz.delegateOrganizer.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DelegateRegistrationDTO {
    private Integer id;
    private String email;
    private String password;
    private String confirmPassword;
}
