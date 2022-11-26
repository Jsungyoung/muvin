package com.example.muvin.domain.img_info;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface Img_infoRepository extends JpaRepository<Img_info, Integer> {

    @Query(value = "select * from img_info where review_no=?",nativeQuery = true)
    List<Img_info> findByNo(long review_no);

    @Query(value = "DELETE FROM img_info where review_no=?",nativeQuery = true)
    void deleteByNo(int review_no);
}
