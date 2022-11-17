package com.example.muvin.controller;

import com.example.muvin.domain.user.UserDto;
import com.example.muvin.service.UserService;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RequiredArgsConstructor
@Controller
public class UserController {

    @Autowired
    private UserService service;

    // 회원가입
    @GetMapping("/signUpForm")
    public String signUpForm(){
        return "signUpForm";
    }
    @RequestMapping("/signUp")
    public String signUp(UserDto userDto) {
        service.createUser(userDto);
        return "redirect:/loginForm";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

}