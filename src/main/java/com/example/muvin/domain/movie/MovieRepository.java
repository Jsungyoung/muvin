package com.example.muvin.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MovieRepository  extends JpaRepository<Movie, Integer> {


    public List<Movie> findByUserId(String userId);

//    @Query(value = "SELECT * FROM movie WHERE user_id=? AND content_type=?", nativeQuery = true)
    public List<Movie> findMoviesByUserIdAndContentType(String userId, String contentType);

    public Movie findByContentIdAndContentType(String ContentId, String contentType);

    public Movie findByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

    public boolean existsByUserIdAndContentIdAndContentType(String userId, String contentId, String contentType);

    @Transactional
    public void deleteByUserIdAndContentIdAndContentTypeAndType(String userId, String contentId, String contentType, String type);

}
