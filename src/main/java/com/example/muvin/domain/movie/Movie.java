package com.example.muvin.domain.movie;

import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Date;

@Table(name = "movie")
@Entity
@NoArgsConstructor
@Setter
public class Movie {

    @Id
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

    public Movie(MovieDto movieDto){
        this.code = movieDto.getCode();
        this.name = movieDto.getName();
        this.poster = movieDto.getPoster();
        this.director = movieDto.getDirector();
        this.regdate = movieDto.getRegdate();
        this.genre = movieDto.getGenre();
        this.actors = movieDto.getActors();
        this.audiAcc = movieDto.getAudiAcc();
        this.rating = movieDto.getRating();
        this.age_limit = movieDto.getAge_limit();
        this.run_time = movieDto.getRun_time();
        this.keyword = movieDto.getKeyword();
        this.content = movieDto.getContent();
    }
}
