package com.example.muvin.controller;

import com.example.muvin.domain.user.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.service.UserService;
import com.mysql.cj.protocol.x.Notice;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


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

    @RequestMapping("/login")
    public String singIn(UserDto userdto, HttpServletRequest request){
        if(service.login(userdto)){
            HttpSession session = request.getSession();
            session.setAttribute("log", userdto.getId());
            return "redirect:/";
        }
        return "loginForm";
    }

    @RequestMapping("/v1/kakao/login?{code}")
    public void getKakaoCode(@PathVariable String code, HttpServletRequest request){
        
    }
}