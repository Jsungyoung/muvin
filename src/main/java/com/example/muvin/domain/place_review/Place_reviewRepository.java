package com.example.muvin.domain.place_review;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;
import java.util.List;

public interface Place_reviewRepository extends JpaRepository<Place_review, Long>{
    @Query(value = "INSERT INTO plave_review values(1,null,'닉네임', '제목', '내용', '2022-11-16', '2022-11-16', 8.8, '닉네임')",nativeQuery = true)
    Place_review createReview(Place_reviewDto reviewDto);

    @Query(value ="SELECT * From place_review WHERE no=?",nativeQuery = true)
    Place_review findMyReview(long no);


}
