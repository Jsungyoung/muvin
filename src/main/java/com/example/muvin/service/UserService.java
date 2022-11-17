package com.example.muvin.service;


import com.example.muvin.domain.user.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;


@RequiredArgsConstructor
@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository repository;

    // 회원가입
    public void createUser (UserDto userDto) {
        User user = userDto.toEntity();
        User findUser = repository.findByUserId(user.getId());
        if(findUser == null){
            repository.save(user);
        }
    }
    // Read
    public User readUserById(String id){
        User user = repository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("사용자를 찾지 못했습니다.")
        );
        return user;
    }
    // 로그인
    public UserDto login(UserDto userDto) {
        User findUser = repository.findByUserId(userDto.getId());

        if (findUser != null) {
            UserDto findUserDto = new UserDto(findUser);
            if (userDto.getPassword().equals(findUserDto.getPassword())) {
                return findUserDto;
            }
        }
        return null;
    }
}
