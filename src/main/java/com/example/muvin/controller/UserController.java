package com.example.muvin.controller;

import com.example.muvin.domain.user.UserDto;
import com.example.muvin.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    @Autowired
    private final UserService service;

    @GetMapping("/signUp-form")
    public String signUpForm(){
        return "signUp";
    }
    @PostMapping("/signUp")
    public String signUp(@ModelAttribute UserDto userDto){
        service.save(userDto);
        return "login";
    }
    @GetMapping("/login-form")
    public String loginForm(){
        return "login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute UserDto userDto, HttpSession session){
        UserDto loginResult = service.login(userDto);
        if(loginResult != null){
            session.setAttribute("id", loginResult.getId());
            return "index";
        }else{
            return "login";
        }
    }
}