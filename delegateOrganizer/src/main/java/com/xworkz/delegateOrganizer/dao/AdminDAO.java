package com.xworkz.delegateOrganizer.dao;

import com.xworkz.delegateOrganizer.entity.AdminEntity;

public interface AdminDAO {
    boolean saveAdminData(AdminEntity adminEntity);
    AdminEntity getStoredPassword(String email);
    boolean adminEmailExists();
}
