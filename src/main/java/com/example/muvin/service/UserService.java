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
    public int idCheck(String id) {
        int result = repository.countById(id);
        return result;
    }

    // 닉네임 중복확인
    public int nickCheck(String nickname) {
        int result = repository.countByNickname(nickname);
        return result;
    }
    // 닉네임
    public String userNick(String id){
        User result = repository.findAllById(id);
        System.out.println("유저 닉네임" + result);
        return result.getNickname();
    }

    // 회원가입
    public void createUser(UserDto userDto) {
        User user = userDto.toEntity();
        repository.save(user);
    }

    public User userInfo(String id) {
        User result = repository.findAllById(id);
        return result;
    }

    // 아이디 찾기
    public String userId(String name, String phone) {
        User result = repository.findByNameAndPhone(name, phone);
        if(result == null){
            return "false";
        }
        return result.getId();
    }

    // 비밀번호 찾기
    public String userPw(String id, String email) {
        User result = repository.findByIdAndEmail(id, email);
        if(result == null) {
            return "false";
        }
        return result.getPassword();
    }

    // 로그인
    public boolean login(String id, String password) {
        User findUser = repository.findAllById(id);

        if (findUser != null) {
            UserDto findUserDto = new UserDto(findUser);
            if (password.equals(findUserDto.getPassword())) {
                return true;
            }
        }
        return false;
    }

    // 회원정보수정
    public void updateUser(String id, String password, String name, String phone, String birth) {
        User user = repository.findAllById(id);
        user.setUser(password, name, phone, birth);
    }

    // 회원탈퇴
    public boolean deleteUser(String id, String password) {
        User findUser = repository.findAllById(id);

        if (password.equals(findUser.getPassword())) {
            repository.deleteById(id);
            return true;
        }
        return false;
    }
}
