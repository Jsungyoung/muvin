package com.example.muvin.controller;

import com.example.muvin.domain.img_info.Img_info;
import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.service.Img_infoService;
import com.example.muvin.service.UserService;
import lombok.RequiredArgsConstructor;

import com.example.muvin.domain.place_review.Place_review;
import com.example.muvin.service.Place_reviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;

import javax.el.ELException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class Place_reviewController {

    @Autowired
    private Place_reviewService service;
    @Autowired
    private Img_infoService imgService;

    @Autowired
    private UserService userService;



//    @PostMapping("v1/`boardWrite`")
//    public void createReview(String visit_date, String pr_nickname, String title, String content){
//        Place_reviewDto reviewDto = new Place_reviewDto(visit_date, pr_nickname, title, content);
//        service.createView(reviewDto);
//    }
//    @GetMapping("v1/moveBoardWriteForm")
//    public void moveBoardWrite(int id,String type, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        HttpSession session = request.getSession();
//
//        String userId = (String)session.getAttribute("log");
//        String nickname = userService.userNick(userId);
//        request.setAttribute("nickname",nickname);
//        System.out.println("nickname" + nickname);
//        request.getRequestDispatcher("/WEB-INF/views/boardWriteForm.jsp?").forward(request, response);
//
//    }

    @PostMapping("/v1/boardWrite")
//    public void createReview(String pr_nickname, String title,  String content, String type, float score,String visit_date, int id){
    public void createReview(@RequestBody Place_reviewDto reviewDto){
//        Place_reviewDto reviewDto = new Place_reviewDto(pr_nickname, title, content, type, score, visit_date, id);
        service.createView(reviewDto);
    }

    @GetMapping("/v1/board/getInfo")
    public String getType(){
        return "/boardWriteForm";
    }


    @GetMapping("/v1/board/reviewAll")
    public List<Place_review> getReviewAll(){
        return service.readReviewAll();
    }


    @GetMapping("/v1/board/maxInt")
    public int searchMaxInt(){
        return service.maxSearch();
    }

    @RequestMapping("/board")
    public void board(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ELException {
         List<Place_review> list = getReviewAll();
         request.setAttribute("list", list);

        // request.getRequestDispatcher("board").forward(request, response);
        request.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(request, response);
    }

//    @RequestMapping("/user/mypage")
//    public void getNickById(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ELException{
//        HttpSession session = request.getSession();
//        String id = (String)session.getAttribute("log");
//        String nickname = userService.userNick(id);
//        System.out.println(nickname);
//
//        session.setAttribute("nickname",nickname);
//
//        request.getRequestDispatcher("/WEB-INF/views/boardWriteForm.jsp").forward(request,response);
//    }

    @GetMapping("/v1/board/readTitle")
    public List<Place_review> readTitle(String title){
        return service.readByTitle(title);
    }

    
//    닉네임을 통해서 리스트값 get하기 작동 확인
    @GetMapping("/v1/board/readNickname")
    public List<Place_review> readByNickname(@RequestParam String pr_nickname){
        return service.readByNickName(pr_nickname);
    }
    @GetMapping("/v1/board/TypeAndId")
    public List<Place_review> readByTypeAndId(@RequestParam String type, @RequestParam int id){
        return service.readByIdAndType(type, id);
    }

    @GetMapping("/v1/board/readContent")
    public List<Place_review> readContent(String content){
        return service.readByContent(content);
    }

    @GetMapping("/v1/board/reviewNo")
    public Place_review readReviewByNo(@RequestParam long no){
        return service.readByNo(no);
    }
    @RequestMapping("/boardView")
    public void boardView(@RequestParam long no, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Place_review review = readReviewByNo(no); // 대충 번호를 통해서 원하는 개시물 번호에 저장된 값 출력해야되는데 어떠케함

        imgService.readByNo(no);
        List<Img_info> list = imgService.readByNo(no);;
        request.setAttribute("images",list);

        session.setAttribute("review",review);
        request.getRequestDispatcher("/WEB-INF/views/boardView.jsp").forward(request, response);
    }
    @RequestMapping("/boardUpdate")
    public void replaceBoard(@RequestParam long no, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        Place_review review = readReviewByNo(no); // 대충 번호를 통해서 원하는 개시물 번호에 저장된 값 출력해야되는데 어떠케함
        session.setAttribute("update",review);
        request.getRequestDispatcher("/WEB-INF/views/boardUpdate.jsp").forward(request,response);
    }

    @PostMapping("/v1/update/board")
    public void updateBoard(@RequestBody Place_reviewDto reviewDto){
        service.UpdateByNo(reviewDto);
    }

    @DeleteMapping("/v1/delete/board")
    public void deleteBoard(@RequestParam long no){
        service.DeleteBoard(no);

    }



}
