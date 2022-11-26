package com.example.muvin.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MovieRepository  extends JpaRepository<Movie, Integer> {


    public List<Movie> findByUserId(String userId);

    public List<Movie> findByUserIdAndContentType(String userId, String contentType);

    public Movie findByContentIdAndContentType(String ContentId, String contentType);

    public Movie findByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

    public boolean existsByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

    @Transactional
    public void deleteByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

}
