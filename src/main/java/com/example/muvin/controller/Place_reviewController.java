package com.example.muvin.controller;

import com.example.muvin.domain.place_review.Place_reviewDto;
import lombok.RequiredArgsConstructor;

import com.example.muvin.domain.place_review.Place_review;
import com.example.muvin.service.Place_reviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;

import javax.el.ELException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class Place_reviewController {

    @Autowired
    private Place_reviewService service;



//    let no = $('#no').val();
//    let visit_date = $('#visit_date').val();
//    let pr_nickname=$('#pr_nickname').val();
//    let title = $('#title').val();
//    let content = $('#content').val();
//    let score = $('#score').val();

    @PostMapping("v1/boardWrite")
    public void createReview(String visit_date, String pr_nickname, String title, String content){
        Place_reviewDto reviewDto = new Place_reviewDto(visit_date, pr_nickname, title, content);
        service.createView(reviewDto);
    }

    @GetMapping("v1/board/reviewAll")
    public List<Place_review> getReviewAll(){
        return service.readReviewAll();
    }
    @RequestMapping("/board")
    public void board(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ELException {
         List<Place_review> list = getReviewAll();
         request.setAttribute("list", list);
        // request.getRequestDispatcher("board").forward(request, response);
        request.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(request, response);
    }


    @GetMapping("v1/board/reviewNo")
    public Place_review readReviewByNo(@RequestParam long no){
        return service.readByNo(no);
    }
    @RequestMapping("/boardView")
    public void boardView(@RequestParam long no, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Place_review review = readReviewByNo(no); // 대충 번호를 통해서 원하는 개시물 번호에 저장된 값 출력해야되는데 어떠케함
        session.setAttribute("review",review);
        request.getRequestDispatcher("/WEB-INF/views/boardView.jsp").forward(request, response);
    }

    @PostMapping("/v1/update/board")
    public void updateBoard(@RequestBody Place_reviewDto reviewDto){
        service.UpdateByNo(reviewDto);
    }




}
