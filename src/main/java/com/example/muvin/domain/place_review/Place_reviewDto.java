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
    private String visit_date;
    private String pr_nickname;
    private String title;
    private String content;
    private double score;

    public Place_reviewDto(long no, String visit_date, String pr_nickname, String title, String content){
        this.no = no;
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
    }
    public Place_reviewDto(String visit_date, String pr_nickname, String title, String content){
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
    }
    public Place_reviewDto(String visit_date, String pr_nickname, String title, String content, double score){
        this.visit_date = visit_date;
        this.pr_nickname = pr_nickname;
        this.title = title;
        this.content = content;
        this.score = score;
    }
}
