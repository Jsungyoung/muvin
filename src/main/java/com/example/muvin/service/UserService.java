package com.example.muvin.service;


import com.example.muvin.domain.user.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;


@RequiredArgsConstructor
@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository repository;

    // id 중복확인
    public int idCheck(String id){
        int result = repository.findByCheckId(id);
        return result;
    }
    // 닉네임 중복확인
    public int nickCheck(String nickname){
        int result = repository.findByCheckNick(nickname);
        return result;
    }

    // 회원가입
    public void createUser (UserDto userDto) {
        User user = userDto.toEntity();
        repository.save(user);


    }

    // 로그인
    public boolean login(String id, String password) {
        User findUser = repository.findByUserId(id);

        if (findUser != null) {
            UserDto findUserDto = new UserDto(findUser);
            if (password.equals(findUserDto.getPassword())) {
                return true;
            }
        }
        return false;
    }
    // 회원탈퇴
    @Transactional
    public void deleteUser(String id, String password){
        repository.deleteById(id);
    }

}
