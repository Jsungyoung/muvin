package com.example.muvin.controller;

import com.example.muvin.domain.user.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.service.SendMailService;
import com.example.muvin.service.UserService;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
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
    // 닉네임 중복확인
    @PostMapping("/checkNick")
    public @ResponseBody int nickCheck(@RequestParam String nickname){
        int result = service.nickCheck(nickname);
        return result;
    }

    // 회원가입
    @GetMapping("/user/signUpForm")
    public String signUpForm(){
        return "user/signUpForm";
    }

    @RequestMapping("/user/signUp")
    public String signUp(UserDto userDto, Model model) {
        service.createUser(userDto);
        model.addAttribute("msg", "회원가입이 완료되었습니다");
        model.addAttribute("url", "/user/loginForm");
        return "user/redirect";
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
    @GetMapping("/user/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @GetMapping("/user/redirect")
    public String redirect(){
        return "user/redirect";
    }
    @PostMapping("/user/login")
    public String singIn(@RequestParam String id, @RequestParam String password, HttpServletRequest request, Model model){
        if(service.login(id,password)){
            HttpSession session = request.getSession();
            session.setAttribute("log", id);
            model.addAttribute("msg", id+"님 환영합니다");
            model.addAttribute("url", "/");
            return "user/redirect";
        }
        model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
        model.addAttribute("url", "/user/loginForm");
        return "user/redirect";
    }

    @PostMapping("/v1/kakao/login")
    @ResponseBody
    public String getKakaoCode(HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        String id = request.getParameter("id");
        if(service.idCheck(id)==0){
            return "/user/signUpForm";
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("log", id);
            return "/";
        }
    }
    // 로그아웃
    @GetMapping("/user/logout")
    public String logout(HttpSession session, Model model) {
        session.removeAttribute("log");
        model.addAttribute("msg", "로그아웃 되었습니다");
        model.addAttribute("url", "/");
        return "user/redirect";
    }
    // 마이페이지
    @GetMapping("/user/mypage")
    public void getInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String)session.getAttribute("log");
        User info = service.userInfo(id);
        session.setAttribute("user",info);
        request.getRequestDispatcher("/WEB-INF/views/user/mypage.jsp").forward(request, response);
    }

    // 회원정보수정
    @GetMapping("/user/updateForm")
    public String updateInfo(){
        return "user/updateForm";
    }

    // 회원정보수정
    @PostMapping("/user/update")
    public String updateUserInfo(HttpSession session,@RequestParam String password, @RequestParam String name, @RequestParam String phone, @RequestParam String birth, Model model) {
        String id = (String)session.getAttribute("log");
        service.updateUser(id,password, name, phone, birth);
        model.addAttribute("msg", "정보가 수정되었습니다");
        model.addAttribute("url", "/user/mypage");
        return "user/redirect";
    }
    // 회원탈퇴
    @GetMapping("/user/deleteForm")
    public String deleteForm(){
        return "user/deleteForm";
    }
    @PostMapping("/user/delete")
    public String deleteInfo(@RequestParam String password, HttpSession session, Model model){
        String id = (String)session.getAttribute("log");
        if(service.deleteUser(id,password)){
            session.removeAttribute("log");
            model.addAttribute("msg", "회원탈퇴가 되었습니다");
            model.addAttribute("url", "/");
            return "user/redirect";
        }
        model.addAttribute("msg", "비밀번호가 틀렸습니다");
        model.addAttribute("url", "/user/deleteForm");
        return "user/redirect";
    }

    // 아이디 찾기
    @GetMapping("/user/findIdForm")
    public String findId(){
        return "/user/findIdForm";
    }
    @PostMapping("/user/findId")
    public String findId(@RequestParam String name, @RequestParam String phone, Model model){
        String id = service.userId(name, phone);
        if(!id.equals("false")) {
            model.addAttribute("msg", name + "님의 아이디는 " + id + "입니다.");
            model.addAttribute("url", "/user/loginForm");
        }else {
            model.addAttribute("msg", "가입하신 정보가 잘못되었습니다.");
            model.addAttribute("url", "/user/loginForm");
        }
        return "user/redirect";
    }
    // 비밀번호 찾기
    @GetMapping("/user/findPwForm")
    public String findPw(){
        return "/user/findPwForm";
    }
    @PostMapping("/user/findPw")
    public String findPw(@RequestParam String id, @RequestParam String email, Model model){
        String pw = service.userPw(id, email);
        if(!pw.equals("false")) {
            mailService.findPassword(email, pw);
            model.addAttribute("msg", "이메일 전송이 완료되었습니다");
            model.addAttribute("url", "/user/loginForm");
        }else {
            model.addAttribute("msg", "가입하신 정보가 잘못되었습니다.");
            model.addAttribute("url", "/user/findPwForm");
        }
        return "user/redirect";
    }
}