package com.example.muvin.entity;

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
public class Place_review {
    @Id
    private int no; // pk
    private Date visit_date;
    private String pk_nickname;
    private String title;
    private String content;
    private double score;

}
