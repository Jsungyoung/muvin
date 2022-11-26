package com.example.muvin.service;

import com.example.muvin.domain.img_info.Img_info;
import com.example.muvin.domain.img_info.Img_infoDto;
import com.example.muvin.domain.img_info.Img_infoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Service
@RequiredArgsConstructor
public class Img_infoService {

    @Autowired
    Img_infoRepository repository;

    //create
    public void createImage(Img_infoDto infoDto){
        System.out.println("service code : "+infoDto.getCode());
        System.out.println("service no : "+infoDto.getReview_no());
        System.out.println("service url : "+infoDto.getUrl());
        Img_info info = new Img_info((infoDto));
        repository.save(info);

    }



    //read
    public List<Img_info> readImgAll(){
        System.out.println("repo :" + repository);
        return repository.findAll();
    }

    public List<Img_info> readByNo(long review_no){
        return repository.findByNo(review_no);
    }

    @Transactional
    public void deleteByNum(int review_no){

        repository.deleteByNo(review_no);
    }

}
