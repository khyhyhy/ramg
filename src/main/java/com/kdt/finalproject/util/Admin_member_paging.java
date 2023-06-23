package com.kdt.finalproject.util;

public class Admin_member_paging {

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

    // JSP에서 표현할 페이징 HTML 코드를 저장할 곳
    private StringBuffer sb;

    // 이전 기능과 다음 기능을 적용할 것인지 안할 것인지 결정하는 변수
    boolean isPrePage; // false
    boolean isNextPage; // false

    public Admin_member_paging() {
    };

    public Admin_member_paging(int numPerpage, int pagePerBlock) {
        this.numPerPage = numPerpage;
        this.pagePerBlock = pagePerBlock;
    }

    // 페이징에 필요한 HTML코드를 생성해 주는 생성자
    public Admin_member_paging(int nowPage, int totalRecord, int numPerPage, int pagePerBlock) {
        this.nowPage = nowPage; // 현재 페이지값
        this.totalRecord = totalRecord; // 총 게시물 수
        this.numPerPage = numPerPage; // 한 페이지에 보여질 게시물 수
        this.pagePerBlock = pagePerBlock; // 한 블럭 당 보여질 페이지 수

        // 총 게시물의 수(totalRecord)가 들어왔으니 총 페이지 수를 구한다.
        totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

        // 총 페이지를 구했으니 현재 페이지가 총 페이지 값을 초과했는지 확인
        if (nowPage > totalPage)
            nowPage = totalPage;

        // 현재 블럭의 시작페이지 값과 마지막 페이지 값을 구하자
        startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
        endPage = startPage + pagePerBlock - 1;

        // 마지막 페이지값이 총 페이지 값보다 크면 안된다.
        if (endPage > totalPage)
            endPage = totalPage;

        // 한 페이지에 보여질 게시물들의 시작 행번호(begin)와 마지막 행번호(end)를 구한다.
        begin = (nowPage - 1) * numPerPage + 1;
        end = nowPage * numPerPage;

        // 이전 기능 가능 여부 확인
        isPrePage = isNextPage = false;

        if (startPage > 1)
            isPrePage = true;

        if (endPage < totalPage)
            isNextPage = true;

        // 페이징에 필요한 주요 변수들이 모두 구해졌으니 HTML코드를 생성하면 된다.
        sb = new StringBuffer("<ol class='paging'>");

        if (isPrePage) { // 이전 기능이 적용되는 상황
            sb.append("<li><a href='/admin/member?cPage=");
            sb.append(startPage - pagePerBlock);
            sb.append("'>&lt;</a></li>"); // <a href='list.inc?cPage=1'> < </a></li>
        } else
            sb.append("<li class='disable'>&lt;</li>");

        // 페이지 번호를 출력하는 반복문
        for (int i = startPage; i <= endPage; i++) {
            // i와 nowPage가 같다면 비활성화, 다를 때만 링크로 활성화
            if (i == nowPage) {
                sb.append("<li class='now'>");
                sb.append(i);
                sb.append("</li>");
            } else {
                sb.append("<li><a href='/admin/member?cPage=");
                sb.append(i); // 전달되는 페이지 값
                sb.append("'>");
                sb.append(i); // 화면에 표현되는 페이지 번호
                sb.append("</a></li>");
            }
        }

        if (isNextPage) { // 다음 기능이 적용되는 상황
            sb.append("<li><a href='/admin/member?cPage=");
            sb.append(startPage + pagePerBlock);
            sb.append("'>&lt;</a></li>"); // <a href='list.inc?cPage=1'> < </a></li>
        } else
            sb.append("<li class='disable'>&gt;</li>");

        sb.append("</ol>");
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

    public StringBuffer getSb() {
        return sb;
    }

}
