package com.example.muvin.domain.user;

import com.example.muvin.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {
    @Query(value = "SELECT * FROM user WHERE id=? AND password=?",nativeQuery = true)
    User findMyid(String id);
}
