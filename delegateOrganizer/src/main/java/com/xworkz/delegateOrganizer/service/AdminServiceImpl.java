package com.xworkz.delegateOrganizer.service;

import com.xworkz.delegateOrganizer.dao.AdminDAO;
import com.xworkz.delegateOrganizer.dto.AdminDTO;
import com.xworkz.delegateOrganizer.encdecyPassword.PasswordEncoder;
import com.xworkz.delegateOrganizer.entity.AdminEntity;
import com.xworkz.delegateOrganizer.service.AdminService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    PasswordEncoder passwordEncoder;


    @Autowired
    AdminDAO adminDAO;


    @Override
    public String saveAdminDetails(AdminDTO adminDTO) {
        System.out.println("Admin data is passed to the service method");

        AdminEntity adminEntity = new AdminEntity();
        BeanUtils.copyProperties(adminDTO, adminEntity);
        String encode = passwordEncoder.encode(adminDTO.getPassword());
        adminEntity.setPassword(encode);
        System.out.println("Encrypted password is : " + encode);
        boolean saved = adminDAO.saveAdminData(adminEntity);
        return "success";
    }

    @Override
    public String loginAdmin(String email,String password) {
        System.out.println("LoginAdmin Service is called");

        AdminEntity adminEntity = adminDAO.getStoredPassword(email);
        if (adminEntity == null) {
            System.out.println("Email not found ");
            return "emailNotFound";
        } else {
            AdminDTO adminDTO = new AdminDTO();
            BeanUtils.copyProperties(adminEntity, adminDTO);
            boolean match = passwordEncoder.match(password, adminDTO.getPassword());
            if (match) {
                System.out.println("Password is matched " + match);
                return "success";
            } else {
                System.out.println("Password is not matched ");
                return "passwordMismatch";
            }
        }
    }

    @Override
    public boolean isAdminRegistered() {
        boolean exists = adminDAO.adminEmailExists();
        System.out.println("Is admin registered in DB: " + exists);
        return exists;
    }
    }