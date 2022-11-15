package com.example.muvin.domain.movie;

import com.example.muvin.util.Timestamp;
import lombok.Setter;

import javax.persistence.Id;

@Setter
public class Movie {

    @Id
    private String code;
    private String name;
    private String poster;
    private String director;
    private Timestamp regdate; //??
    private String genre;
    private String actors;
    private int audiAcc;
    private double rating;
    private String age_limit;
    private int run_time;
    private String keyword;

    pri
}
