package com.example.muvin.service;

import com.example.muvin.domain.movie.Movie;
import com.example.muvin.domain.movie.MovieDto;
import com.example.muvin.domain.movie.MovieRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MovieService {

    @Autowired
    private MovieRepository repository;

    // movie에 crud가 필요한가? 필요하겠지? ,, 일단 만들어두기

    // CREATE
    public void createMovie(MovieDto movieDto){
        Movie movie = new Movie(movieDto);
    }


}
