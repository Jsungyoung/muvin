package com.example.muvin.controller;

import com.example.muvin.domain.user.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.service.SendMailService;
import com.example.muvin.service.UserService;
import com.mysql.cj.protocol.x.Notice;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@RequiredArgsConstructor
@Controller
public class UserController {

    @Autowired
    private UserService service;
    @Autowired
    private SendMailService mailService;

    // id중복확인
    @PostMapping("/checkId")
    public @ResponseBody int idCheck(@RequestParam String id){
        int result = service.idCheck(id);
        return result;
    }
    @PostMapping("/checkNick")
    public @ResponseBody int nickCheck(@RequestParam String nickname){
        int result = service.nickCheck(nickname);
        return result;
    }

    // 회원가입
    @GetMapping("/signUpForm")
    public String signUpForm(){
        return "signUpForm";
    }

    @GetMapping("/mypage")
    @ResponseBody
    public String mypage(User user){
        return "mypage";
    }
    @RequestMapping("/signUp")
    public String signUp(UserDto userDto) {
        service.createUser(userDto);
        return "redirect:/loginForm";
    }
    //이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
        System.out.println("이메일 인증 요청이 들어옴!");
        System.out.println("이메일 인증 이메일 : " + email);
        return mailService.joinEmail(email);
    }
    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/login")
    public String singIn(@RequestParam String id, @RequestParam String password, HttpServletRequest request){
        if(service.login(id,password)){
            HttpSession session = request.getSession();
            session.setAttribute("log", id);
            return "redirect:/";
        }
        return "loginForm";
    }

    @PostMapping("/v1/kakao/login")
    @ResponseBody
    public String getKakaoCode(HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        String id = request.getParameter("id");
        if(service.idCheck(id)==0){
            return "/signUpForm";
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("log", id);
            return "/";
        }
    }
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("log");

        return "redirect:/";
    }


}