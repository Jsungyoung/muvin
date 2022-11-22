package com.example.muvin.domain.place_review;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.validation.executable.ValidateOnExecution;
import java.util.ArrayList;
import java.util.List;

public interface Place_reviewRepository extends JpaRepository<Place_review, Long>{


    @Query(value ="SELECT * From place_review WHERE no=?",nativeQuery = true)
    Place_review findMyReview(long no);

//    @Query(value = "UPDATE place_review SET title = ?, content = ? where `no` = ?",nativeQuery = true)
//    Place_review updateReview(String title, String content, long no);

//    @Query(value = "DELETE FROM place_review WHERE `no`=?",nativeQuery = true)
//    Place_review deletePlace_review(long no);
    @Query(value="select * from place_review where content like %?%", nativeQuery=true)
    List<Place_review> findContent(@Param("content") String content);

    @Query(value="select * from place_review where title like %?%", nativeQuery=true)
    List<Place_review> findTitle(@Param("Title") String Title);
}
