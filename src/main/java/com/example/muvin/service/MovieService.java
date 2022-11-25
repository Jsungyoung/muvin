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
    public Movie createMovie(MovieDto movieDto){
        Movie movie = new Movie(movieDto);
        return repository.save(movie);
    }

    // READ
    public Movie readMovieByCode(int code){
        return repository.getReferenceById(code);
    }

    public Movie readMovieByCodeAndContentType(String contentId, String contentType){
        return repository.findByContentIdAndContentType(contentId, contentType);
    }

    public boolean checkContent(String userId, String contentId, String contentType, String type){
        return repository.existsByUserIdAndContentIdAndContentTypeAndType(userId, contentId, contentType, type);
    }

    public List<Movie> readMovieByUserId(String userId){
        List<Movie> movies = repository.findByUserId(userId);
        return movies;
    }

    public List<Movie> readMovieByUserIdAndContentType(String userId, String contentType){
        return repository.findByUserIdAndContentType(userId, contentType);
    }

    // DELETE
    public void deleteMovieByCode(int code){
        repository.deleteById(code);
    }

//    public void deleteContent(String userId, String contentId, String contentType, String type){
//        System.out.println(userId);
//        System.out.println(contentId);
//        System.out.println(contentType);
//        System.out.println(type);
//        repository.deleteByUserIdAndContentIdAndContentTypeAndType(userId, contentId, contentType, type);
//    }

    public void deleteContent(MovieDto movieDto){
        Movie movie = new Movie(movieDto);
        repository.delete(movie);
    }

}
