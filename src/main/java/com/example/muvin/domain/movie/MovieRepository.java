package com.example.muvin.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MovieRepository  extends JpaRepository<Movie, Integer> {


    public List<Movie> findByUserId(String userId);

    public List<Movie> findByUserIdAndContentType(String userId, String contentType);

    public Movie findByContentIdAndContentType(String ContentId, String contentType);

    public boolean existsByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

    public void deleteByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

}
