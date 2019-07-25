package com.zy.vo;
//用户权限表
public class UserAuth {
    private Integer userAuthId;//主键id

    private Integer userId;//用户id

    private Integer authId;//权限id

    public Integer getUserAuthId() {
        return userAuthId;
    }

    public void setUserAuthId(Integer userAuthId) {
        this.userAuthId = userAuthId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAuthId() {
        return authId;
    }

    public void setAuthId(Integer authId) {
        this.authId = authId;
    }
}