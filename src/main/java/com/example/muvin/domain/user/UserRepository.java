package com.example.muvin.domain.user;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.function.Function;

public interface UserRepository extends JpaRepository<User, String> {

    public User findAllById(String id);

    public int countById(String id);

    public int countByNickname(String nickname);

    public User findByNameAndPhone(String name, String phone);

    public User findByIdAndEmail(String id, String email);
}
