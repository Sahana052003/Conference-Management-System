package com.xworkz.delegateOrganizer.dao;

import com.xworkz.delegateOrganizer.entity.AdminEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;

@Repository
public class AdminDAOImpl implements AdminDAO {

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    @Override
    @Transactional
    public boolean saveAdminData(AdminEntity adminEntity) {
        System.out.println("DAO method is called");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(adminEntity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            System.out.println("While Saving Admin data error: " + e.getMessage());
            return false;
        }finally {
            entityManager.close();
        }
        }


    @Override
    public AdminEntity getStoredPassword(String email) {
        System.out.println("Through email I'm entering password");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("findEmail");
            query.setParameter("emailId",email);
            AdminEntity adminEntity = (AdminEntity) query.getSingleResult();
            System.out.println("Email found is : " + email);
            return adminEntity;
        }catch (Exception e){
            System.out.println("Password not found : " + e.getMessage());
        return null;
    }finally {
            entityManager.close();
        }
        }

    @Override
    public boolean adminEmailExists() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Long count = (Long) entityManager
                    .createNamedQuery("checkEmailExists")
                    .getSingleResult();
            System.out.println("Admin register : " + count);
            return count > 0;
        } catch (Exception e) {
            System.out.println("Email error " + e.getMessage());
            return false;
        }finally {
            entityManager.close();
        }

    }
}

