package com.example.muvin.domain.movie;

import com.example.muvin.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MovieDto {

    private String code;
    private String name;
    private String poster;
    private String director;
    private Timestamp regdate; //??ㅠㅠ
    private String genre;
    private String actors;
    private int audiAcc;
    private double rating;
    private String age_limit;
    private int run_time;
    private String keyword;

}
