package com.xworkz.delegateOrganizer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDTO {
    private Integer id;

    @NotNull(message = "Email is required")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@gmail\\.com$",
            message = "Must be a valid @gmail.com address")
    private String email;

    @NotNull(message = "Password is required")
    @Size(min = 8, message = "Minimum 8 characters")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$",
            message = "Must contain uppercase, number, and special character")
    private String password;

    @NotNull(message = "Confirm password is required")
    private String confirmPassword;
}
