package com.kh.spring.common.model.vo;

import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;

public class ListResponse {
    private ArrayList<Club> list;
    private PageInfo pageInfo;

    public ListResponse(ArrayList<Club> list, PageInfo pageInfo) {
        this.list = list;
        this.pageInfo = pageInfo;
    }

    public ArrayList<Club> getList() {
        return list;
    }

    public void setList(ArrayList<Club> list) {
        this.list = list;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}

