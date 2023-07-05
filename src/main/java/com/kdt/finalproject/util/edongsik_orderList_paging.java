package com.kdt.finalproject.util;

public class edongsik_orderList_paging {

    int nowPage = 1; // 현재 페이지 값 == cPage
    int numPerPage = 10; // 한 페이지당 보여질 게시물 수

    // 페이징을 위한 변수
    int totalRecord; // 총 게시물 수

    int pagePerBlock = 5;// 페이지 묶음(한 블럭당 보여질 페이지 수)

    int totalPage; // 전체 페이지 수

    int begin; // 현재 페이지 값에 따라 bbs_t테이블에서 가져올 게시물의 시작부분
    int end; // 현재 페이지 값에 따라 bbs_t테이블에서 가져올 게시물의 마지막부분
    int startPage; // 한 블럭의 시작페이지 값
    int endPage; // 한 블럭의 마지막 페이지 값

    public edongsik_orderList_paging() {
    }// 기본생성자

    public edongsik_orderList_paging(int numPerpage, int pagePerBlock) {
        this.numPerPage = numPerpage;
        this.pagePerBlock = pagePerBlock;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;

        // 현재페이지 값이 바뀌면 표현할 게시물들이 변경되어야 한다.
        // 즉, begin과 end값이 변경되어 DB로부터 다시 가져와야 한다.

        // 현재 페이지 값은 총페이지 값을 넘으면 안된다.
        if (nowPage > totalPage)
            nowPage = totalPage;

        // 각 페이지 의 시작레코드(begin)과 마지막(end)를 지정하자
        // 현재페이지가 1: begin:1, end:10
        // 현재페이지가 2: begin:11, end:20
        // 현재페이지가 3: begin:21, end:30
        // 현재페이지가 4: begin:31, end:40
        begin = (nowPage - 1) * numPerPage + 1;
        end = nowPage * numPerPage;

        // 현재페이지 값에 의해 블럭의 시작페이지(startPage)값 구하자! (1,6,11,16,...)
        startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;

        // 블럭의 마지막페이지 값 구하기
        endPage = startPage + pagePerBlock - 1;

        // 위에서 구한 마지막페이지 값이 전체페이지 수보다 클때가 우려된다.
        if (endPage > totalPage)
            endPage = totalPage;
    }

    public int getNumPerPage() {
        return numPerPage;
    }

    public void setNumPerPage(int numPerPage) {
        this.numPerPage = numPerPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord; // 총 게시물의 수가 정해지면
        // 자동으로 총 페이지 수를 구하자!
        /*
         * this.totalPage = totalRecord/numPerPage;
         * if(totalRecord%numPerPage != 0)
         * this.totalPage++;
         */
        totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
    }

    public int getPagePerBlock() {
        return pagePerBlock;
    }

    public void setPagePerBlock(int pagePerBlock) {
        this.pagePerBlock = pagePerBlock;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

}
