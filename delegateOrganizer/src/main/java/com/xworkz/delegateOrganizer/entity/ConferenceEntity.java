package com.xworkz.delegateOrganizer.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "conferenceLogin_tb")


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConferenceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    
    private String name;
    private String email;
    private String venue;
    private Date conferenceDate;
    private String organizerName;
    private String description;
    private Integer maxCapacity;


    private Long registeredCount;
    private  Long spotsLeft;
}
