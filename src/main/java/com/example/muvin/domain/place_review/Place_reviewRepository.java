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

    @Query(value="select * from place_review where content like %?%", nativeQuery=true)
    List<Place_review> findContent(@Param("content") String content);

    @Query(value="select * from place_review where title like %?%", nativeQuery=true)
    List<Place_review> findTitle(@Param("Title") String Title);

    @Query(value="SELECT * FROM place_review where pr_nickname=?",nativeQuery = true)
    List<Place_review> findByNickname(@Param("pr_nickname") String pr_nickname);

    @Query(value="SELECT max(`no`)+1 FROM place_review", nativeQuery = true)
    int searchMaxNo();
}
