package com.xworkz.delegateOrganizer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ConferenceRegistrationController {
    public ConferenceRegistrationController(){
        System.out.println("ConferenceRegistrationController is called");
    }

    @GetMapping("conferenceregister")
    public String showRegisterPage(){
        return "conference";
    }
}
