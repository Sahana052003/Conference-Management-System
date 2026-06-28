package com.xworkz.delegateOrganizer.controller;

import com.xworkz.delegateOrganizer.dto.AdminDTO;
import com.xworkz.delegateOrganizer.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HomeController {
    public HomeController() {
        System.out.println("HomeController is Called");
    }

    @Autowired
    AdminService adminService;


    @GetMapping("index")
    public String showHomePage() {
        System.out.println("Home Page is dispalyed");
        return "index";
    }


    @GetMapping("adminregister")
    public String getAdminPage() {
        System.out.println("Admin Login Details");
        return "adminregister";
    }


    // ── KEY METHOD: Admin Login button click → decide where to go ─────────────
    @GetMapping("adminloginRoute")
    public String adminLoginRoute(Model model) {
        System.out.println("adminloginRoute called");

        boolean adminExists = adminService.isAdminRegistered();
        System.out.println("Admin exists in DB: " + adminExists);

        if (adminExists) {
            // Admin already registered → open modal on index.jsp
            model.addAttribute("openModal", true);
            return "index";
        } else {
            // No admin yet → go to register page
            return "adminregister";
        }
    }



    @PostMapping("adminregister")
    public String saveadminLoginData(@Valid AdminDTO adminDTO, BindingResult bindingResult, Model model) {
        System.out.println("Entered Admin Details ");
        if (bindingResult.hasErrors()) {
            if (bindingResult.hasFieldErrors("email"))
                model.addAttribute("EmailError", bindingResult.getFieldError("email").getDefaultMessage());
            if (bindingResult.hasFieldErrors("password"))
                model.addAttribute("passwordError", bindingResult.getFieldError("password").getDefaultMessage());
            if (bindingResult.hasFieldErrors("confirmPassword"))
                model.addAttribute("confirmPasswordError", bindingResult.getFieldError("confirmPassword").getDefaultMessage());
            return "adminregister";
        }
        if (!adminDTO.getPassword().equals(adminDTO.getConfirmPassword())) {
            model.addAttribute("confirmPasswordError", "Passwords do not match");
            return "adminregister";
        }


        String result = adminService.saveAdminDetails(adminDTO);
        if ("success".equals(result)){
            model.addAttribute("saveSuccess", "Admin registered successfully!");
        return "index";
    }else{
        model.addAttribute("saveError", "Failed to save. Please try again.");
        return "adminregister";
    }
}

    @PostMapping("adminloginCheck")
    public String adminLogin(@Valid AdminDTO adminDTO,
                             BindingResult bindingResult,
                             Model model) {
        // Server-side field errors → shown in red via <c:if> when JS is OFF
        if (bindingResult.hasErrors()) {
            if (bindingResult.hasFieldErrors("email"))
                model.addAttribute("EmailError",
                        bindingResult.getFieldError("email").getDefaultMessage());
            if (bindingResult.hasFieldErrors("password"))
                model.addAttribute("passwordError",
                        bindingResult.getFieldError("password").getDefaultMessage());
            return "adminlogin";
        }
        String result = adminService.loginAdmin(adminDTO.getEmail(),adminDTO.getPassword());
        System.out.println("Validate the login details" + result);
        if ("success".equals(result)) {
            model.addAttribute("loginSuccess","Welcome Back, Admin");
            return "index";

        } else if ("emailNotFound".equals(result)) {
            model.addAttribute("loginError", "No admin found with that email.");

        } else if ("passwordMismatch".equals(result)) {
            model.addAttribute("loginError", "Incorrect password. Try again.");

        } else {
            model.addAttribute("loginError", "Login failed. Please try again.");
        }

        return "index";
    }
}

