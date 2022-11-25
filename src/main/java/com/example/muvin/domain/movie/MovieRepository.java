package com.example.muvin.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MovieRepository  extends JpaRepository<Movie, Integer> {

    public Movie findByContentIdAndContentType(String contentId, String contentType);
    public List<Movie> findByUserId(String userId);

    public List<Movie> findByUserIdAndContentType(String userId, String contentType);

    public Movie findByContentIdAndContentType(String contentId, String contentType);
}
