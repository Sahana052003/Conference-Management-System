package com.xworkz.delegateOrganizer.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "admin_tb")
@Data
@NoArgsConstructor
@AllArgsConstructor




@NamedQuery(name = "findEmail",query="select e from AdminEntity e where e.email=:emailId")


@NamedQuery(name = "checkEmailExists", query = "SELECT COUNT(a) FROM AdminEntity a")

public class AdminEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;
    private String password;

}
