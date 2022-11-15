package com.example.muvin.controller;

import com.example.muvin.domain.user.UserDto;
import com.example.muvin.entity.User;
import com.example.muvin.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService service;

    // 회원가입
    @PostMapping("/signUp")
    public String signUp(@RequestBody UserDto userDto){
        service.createUser(userDto);
        return "login";
    }


}