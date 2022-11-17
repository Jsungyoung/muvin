package com.example.muvin.domain.place_review;

import com.example.muvin.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Primary;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;


@Table(name = "place_review")
@Entity
@AllArgsConstructor
@NoArgsConstructor // 기본 생성자
@Data
public class Place_review extends Timestamp {
    @Id
    private long no; // pk
    private Date visit_date;
    private String pr_nickname;
    private String title;
    private String content;
    private double score;

    public Place_review(Place_reviewDto reviewDto){
        this.no = reviewDto.getNo();
        this.visit_date = reviewDto.getVisit_date();
        this.pr_nickname = reviewDto.getPr_nickname();
        this.title = reviewDto.getTitle();
        this.content = reviewDto.getContent();
        this.score=reviewDto.getScore();
    }


}