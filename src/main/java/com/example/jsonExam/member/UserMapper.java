package com.example.jsonExam.member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

@Mapper
public interface UserMapper {

    // 회원 등록
    @Insert("INSERT INTO users (id, pw, user_name, postcode, address, detail_address, mobile) " +
            "VALUES (#{id}, #{pw}, #{userName}, #{postcode}, #{address}, #{detailAddress}, #{mobile})")
    void registerUser(UserDTO user);

    // 로그인용 ID+비밀번호 조회
    @Select("SELECT * FROM users WHERE id = #{id} AND pw = #{pw}")
    UserDTO findUserByIdAndPassword(@Param("id") String id, @Param("pw") String password);

    // 비밀번호로 사용자 조회
    @Select("SELECT * FROM users WHERE pw = #{pw}")
    UserDTO getUserByPw(@Param("pw") String pw);

    // 아이디로 사용자 조회
    @Select("SELECT * FROM users WHERE id = #{id}")
    UserDTO getUserById(@Param("id") String id);

    // 회원 정보 수정
    @Update("UPDATE users SET pw = #{pw}, user_name = #{userName}, postcode = #{postcode}, " +
            "address = #{address}, detail_address = #{detailAddress}, mobile = #{mobile} WHERE id = #{id}")
    int updateUser(UserDTO user);

    // 회원 삭제
    @Delete("DELETE FROM users WHERE id = #{id}")
    int deleteUser(@Param("id") String id);

    // 사용자 추가 (registerUser와 동일한 기능이라면 생략 가능)
    @Insert("INSERT INTO users (id, pw, user_name, postcode, address, detail_address, mobile) " +
            "VALUES (#{id}, #{pw}, #{userName}, #{postcode}, #{address}, #{detailAddress}, #{mobile})")
    void insertUser(UserDTO user);
}
