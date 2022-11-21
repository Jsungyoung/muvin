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

import javax.script.ScriptContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpHeaders;


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
    // 닉네임 중복확인
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
    // 로그인
    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }


    @PostMapping("/login")
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
    // 마이페이지
    @GetMapping("/mypage")
    public void getInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String)session.getAttribute("log");
        User info = service.userInfo(id);
        session.setAttribute("user",info);
        request.getRequestDispatcher("/WEB-INF/views/mypage.jsp").forward(request, response);
    }

    // 회원정보수정
    @GetMapping("/updateForm")
    public String updateInfo(){
        return "/updateForm";
    }

    // 회원정보수정
    @PostMapping("/update")
    public String updateUserInfo(HttpSession session,@RequestParam String password, @RequestParam String name, @RequestParam String phone, @RequestParam String birth) {
        String id = (String)session.getAttribute("log");
        service.updateUser(id,password, name, phone, birth);
        return "redirect:mypage";
    }
    // 회원탈퇴
    @GetMapping("/deleteForm")
    public String deleteForm(){
        return "/deleteForm";
    }
    @PostMapping("/delete")
    public String deleteInfo(@RequestParam String password, HttpSession session){
        String id = (String)session.getAttribute("log");
        if(service.deleteUser(id,password)){
            session.removeAttribute("log");
            return "redirect:/";
        }
        return "redirect:deleteForm";
    }
}