package com.example.muvin.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MovieRepository  extends JpaRepository<Movie, Integer> {

    public List<Movie> findByUserId(String userId);

    public Movie findByContentIdAndContentType(int contentId, String contentType);

}
