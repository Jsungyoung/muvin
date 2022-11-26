package com.example.muvin.domain.place_review;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Place_reviewDto {

    private long no; // pk
    private String pr_nickname;
    private String visit_date;
    private String title;
    private String content;
    private float score;
    private String type;
    private int id;

    public Place_reviewDto(String pr_nickname, String title, String content, String type, float score, String visit_date, int id){
        this.pr_nickname = pr_nickname;
        this.visit_date = visit_date;
        this.title = title;
        this.content = content;
        this.type = type;
        this.score = score;
        this.id = id;
    }

    public Place_reviewDto(long no, String visit_date, String pr_nickname, String title, String content){
        this.no = no;
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
    }
//    public Place_reviewDto(long no, String visit_date, String pr_nickname, String title, String content, double score){
//        this.no = no;
//        this.visit_date = visit_date;
//        this.pr_nickname = pr_nickname;
//        this.title = title;
//        this.content = content;
//        this.score = score;
//    }
    public Place_reviewDto(String visit_date, String pr_nickname, String title, String content){
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
    }
    public Place_reviewDto(String visit_date, String pr_nickname, String title, String content, float score){
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
        this.score = score;
    }


}
