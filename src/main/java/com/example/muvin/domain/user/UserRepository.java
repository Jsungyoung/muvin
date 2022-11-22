package com.example.muvin.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {
    @Query(value = "SELECT * FROM user WHERE `id`=?",nativeQuery = true)
    public User findByUserId(String id);

    @Query(value = "SELECT count(`id`) FROM user WHERE `id`=?",nativeQuery = true)
    public int findByCheckId(String id);

    @Query(value = "SELECT count(`nickname`) FROM user WHERE `nickname`=?",nativeQuery = true)
    public int findByCheckNick(String nickname);

    @Query(value = "SELECT `id` FROM user WHERE `name`=? AND `phone`=?",nativeQuery = true)
    public String findByNameAndPhone(String name, String phone);

    @Query(value = "SELECT `password` FROM user WHERE `id`=? AND `email`=?",nativeQuery = true)
    public String findByIdAndEmail(String id, String email);
}
