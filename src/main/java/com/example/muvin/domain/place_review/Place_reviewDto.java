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
    private int no; // pk
    private Date visit_date;
    private String pk_nickname;
    private String title;
    private String content;
    private double score;
}
