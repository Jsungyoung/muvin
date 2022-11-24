package com.example.muvin.service;

import com.example.muvin.domain.movie.Movie;
import com.example.muvin.domain.movie.MovieDto;
import com.example.muvin.domain.movie.MovieRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class MovieService {

    @Autowired
    private MovieRepository repository;

    // CREATE
    public void createMovie(MovieDto movieDto){
        Movie movie = new Movie(movieDto);
    }

    // READ
    public Movie readMovieByCode(int code){
        return repository.getReferenceById(code);
    }

    public List<Movie> readMovieByUserId(String userId){
        List<Movie> movies = repository.findByUserId(userId);
        return movies;
    }

    // DELETE
    public void DeleteMovieByCode(int code){
        repository.deleteById(code);
    }


}
