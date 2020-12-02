package org.wof.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;


@Controller
@AllArgsConstructor
public class securityController {

    @GetMapping("/main")
    public void main(){}

    @GetMapping("/accessError")
    public void accessDenied(Authentication auth, Model model){
        model.addAttribute("msg","Access Denied");
    }

    @GetMapping("/member/customlogin")
    public String loginInput(String error, String logout, Model model){

        if (error != null){
            model.addAttribute("error","Login Error Check Your Account");
        }
        if (logout != null){
            model.addAttribute("logout","Logout!");
        }

        return "member/customlogin";
    }


}
