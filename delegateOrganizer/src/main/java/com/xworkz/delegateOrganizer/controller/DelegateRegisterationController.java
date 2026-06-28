package com.xworkz.delegateOrganizer.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class DelegateRegisterationController {
    public DelegateRegisterationController(){
        System.out.println("DelegateRegisterationController is called");
    }

    @GetMapping("delegateregister")
    public String showRegisterPage(){

        return "delegate";
    }

}
