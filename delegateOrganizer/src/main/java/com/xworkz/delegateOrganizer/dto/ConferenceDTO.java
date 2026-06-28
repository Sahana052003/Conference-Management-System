package com.xworkz.delegateOrganizer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConferenceDTO {
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
