package com.example.muvin.controller;


import com.example.muvin.domain.img_info.Img_info;
import com.example.muvin.domain.img_info.Img_infoDto;
import com.example.muvin.service.Img_infoService;
import com.example.muvin.service.Place_reviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.el.ELException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class Img_infoController {
    private final Img_infoService service;

    @PostMapping("/v1/image/create")
    public void createImage(@RequestBody Img_infoDto infoDto){
        System.out.println("service no : "+infoDto.getReview_no());
        System.out.println("service url : "+infoDto.getUrl());
        service.createImage(infoDto);
    }

    @GetMapping("/v1/image/findAll")
    public List<Img_info> getImageAll(){
        return service.readImgAll();
    }
    @GetMapping("/v1/image/findByNo")
    public List<Img_info> getImgByNo(long review_no){
        return service.readByNo(review_no);
    }

    @RequestMapping("/boardViewImg")
    public void ImgView(@RequestParam long no, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ELException {
        List<Img_info> list = getImgByNo(no);
        request.setAttribute("images",list);

        request.getRequestDispatcher("/WEB-INF/views/boardView.jsp").forward(request, response);
    }
    @DeleteMapping("/v1/image/delete")
    public void deleteImage(@RequestParam int review_no){
        System.out.println("reviewNo : " + review_no);
        service.deleteByNum(review_no);
    }

}
