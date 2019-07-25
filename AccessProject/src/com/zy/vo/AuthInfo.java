package com.zy.vo;

import java.util.Date;
import java.util.List;
//权限表
public class AuthInfo {
    private Integer authId; //权限id

    private Integer parentId;//权限父

    private String authName;//权限名称

    private String authDesc;//权限描述

    private Integer authGrade;//权限级别

    private String authType;//权限类型

    private String authUrl;//权限url

    private String authCode;//权限代码

    private Integer authOrder;//权限排序

    private String authState;//权限状态

    private Integer createBy;//创建人

    private Date createTime;//创建时间

    private Integer updateBy;//修改人

    private Date updateTime;//修改时间

    private List<AuthInfo> childList;

    
    
	public List<AuthInfo> getChildList() {
		return childList;
	}

	public void setChildList(List<AuthInfo> childList) {
		this.childList = childList;
	}

	public Integer getAuthId() {
        return authId;
    }

    public void setAuthId(Integer authId) {
        this.authId = authId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getAuthName() {
        return authName;
    }

    public void setAuthName(String authName) {
        this.authName = authName == null ? null : authName.trim();
    }

    public String getAuthDesc() {
        return authDesc;
    }

    public void setAuthDesc(String authDesc) {
        this.authDesc = authDesc == null ? null : authDesc.trim();
    }

    public Integer getAuthGrade() {
        return authGrade;
    }

    public void setAuthGrade(Integer authGrade) {
        this.authGrade = authGrade;
    }

    public String getAuthType() {
        return authType;
    }

    public void setAuthType(String authType) {
        this.authType = authType == null ? null : authType.trim();
    }

    public String getAuthUrl() {
        return authUrl;
    }

    public void setAuthUrl(String authUrl) {
        this.authUrl = authUrl == null ? null : authUrl.trim();
    }

    public String getAuthCode() {
        return authCode;
    }

    public void setAuthCode(String authCode) {
        this.authCode = authCode == null ? null : authCode.trim();
    }

    public Integer getAuthOrder() {
        return authOrder;
    }

    public void setAuthOrder(Integer authOrder) {
        this.authOrder = authOrder;
    }

    public String getAuthState() {
        return authState;
    }

    public void setAuthState(String authState) {
        this.authState = authState == null ? null : authState.trim();
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}