package com.example.muvin.domain.movie;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MovieDto {

    private String code;
    private String name;
    private String poster;
    private String director;
    private Date regdate;
    private String genre;
    private String actors;
    private int audiAcc;
    private double rating;
    private String age_limit;
    private int run_time;
    private String keyword;
    private String content;
}
