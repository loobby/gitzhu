package com.dao.www;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.vo.www.UserRole;
import com.vo.www.UserRoleExample;

public interface UserRoleMapper {
    int countByExample(UserRoleExample example);

    int deleteByExample(UserRoleExample example);

    int deleteByPrimaryKey(Integer userRoleId);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    List<UserRole> selectByExample(UserRoleExample example);

    UserRole selectByPrimaryKey(Integer userRoleId);

    int updateByExampleSelective(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByExample(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}