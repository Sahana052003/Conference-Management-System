package com.xworkz.delegateOrganizer.service;

import com.xworkz.delegateOrganizer.dto.AdminDTO;

public interface AdminService {
    String saveAdminDetails(AdminDTO adminDTO);
    String loginAdmin(String email,String password);

    boolean isAdminRegistered();

}
