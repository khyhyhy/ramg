package com.kdt.finalproject.util;

public class Paging {

 int nowPage = 1; // 현재 페이지의 값
 int numPerPage = 10; // 한 페이지당 보여질 레코드(게시물)의 수

 // 페이징을 위한 변수
 Long totalRecord; // 총 게시물의 수
 int pagePerBlock = 5; // 페이지 묶음(한 블럭당 보여질 페이지의 수)
 int totalPage; // 전체 페이지의 수

 // 게시물 레코드를 가져오기 위한 변수

 int begin; // 현재 페이지의 값에따라 bbs_t db테이블에서 가져올 게시물의 시작 레코드를 의미
 int end; // 현재 페이지의 값에따라 bbs_t db테이블에서 가져올 게시물의 마지막 레코드를 의미

 int startPage; // 한 블럭의 시작 페이지값
 int endPage; // 한 블럭의 마지막 페이지값

 int area_Code;
 int content_TypeId;

 public Paging() {
 }

 public Paging(int numPerPage, int pagePerBlock) {
  this.numPerPage = numPerPage;
  this.pagePerBlock = pagePerBlock;

 }

 // jsp에서 표현할 페이지 블럭 이동 html 코드
 StringBuffer sb;
 // 이전기능과 다음기능을 구분할 변수
 boolean isPrePage;
 boolean isNextPage;

 // 페이징에 필요한 html 코드를 생성해주는 생성자
 public Paging(int nowPage, Long totalRecord, int numPerPage, int pagePerBlock, int area_Code, int content_TypeId) {
  this.nowPage = nowPage; // 현재 페이지 값
  this.totalRecord = totalRecord; // 총 게시물 수
  this.numPerPage = numPerPage; // 한 페이지에 보여질 게시물 수
  this.pagePerBlock = pagePerBlock; // 한 블럭당 보여질 페이지 수

  // 총 게시물 수(totalRecord)가 들어왔으니 총 페이지 수를 구할 수 있음
  totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
  // 총 페이지를 구했으니 현재페이지가 총페이지 값을 초과했는지 확인해야함
  if (nowPage > totalPage) {
   nowPage = totalPage;
  }
  // 현재 블럭의 시작 페이지의 값과 마지막 페이지 값을 구해야함
  startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
  endPage = startPage + pagePerBlock - 1;

  // 마지막 페이지값이 총 페이지 값보다 크면 안됨
  if (endPage > totalPage) {
   endPage = totalPage;
  }
  // 이제는 한 페이지에 보여줄 게시물들의 시작 행 번호와 마지막 번호를 구한다
  begin = (nowPage - 1) * numPerPage + 1;
  end = nowPage * numPerPage;

  // 이전 기능 가능 여부 확인
  isPrePage = false;
  isNextPage = false;
  if (startPage > 1) {
   isPrePage = !isPrePage;
  }
  if (endPage < totalPage) {
   isNextPage = !isNextPage;
  }
  // 페이징에 필요한 변수들이 지정되었으니 html코드를 생성한다.

  sb = new StringBuffer();
  if (isPrePage) {
   // 이전기능이 적용되는 상황
   sb.append("<li class='page-item'><a class='page-link mycustom-paging' aria-label='Previous' href=/tour?cPage="
     + (startPage - pagePerBlock) + "&area_Code=" + area_Code + "&content_TypeId=" + content_TypeId
     + "><span aria-hidden='true'>&lt;</span></a></li>");

  } else {
   sb.append("<li class='page-item disabled'><a class='page-link mycustom-paging' aria-disabled='true'>&lt;</a></li>");
  }
  // 페이지 번호를 출력하는 반복문
  for (int i = startPage; i <= endPage; i++) {
   // i와 nowPage가 같다면 비활성화 다를때만 활성화
   if (i == nowPage) {
    sb.append("<li class='page-item'><a class='page-link mycustom-paging-now' href='/tour?cPage=");
    sb.append(i);
    sb.append("&area_Code=" + area_Code);
    sb.append("&content_TypeId=" + content_TypeId);
    sb.append("'>");
    sb.append(i);
    sb.append("</a></li>");
   } else {
    sb.append("<li class='page-item'><a class='page-link mycustom-paging' href='/tour?cPage=");
    sb.append(i);
    sb.append("&area_Code=" + area_Code);
    sb.append("&content_TypeId=" + content_TypeId);
    sb.append("'>");
    sb.append(i);
    sb.append("</a></li>");
   }
  }
  if (isNextPage) {
   // 다음기능이 적용되는 상황
   sb.append("<li class='page-item'><a class='page-link mycustom-paging' aria-label='Next' href=/tour?cPage="
     + (startPage + pagePerBlock) + "&area_Code=" + area_Code + "&content_TypeId=" + content_TypeId
     + "><span aria-hidden='true'>&gt;</span></a></li>");
  } else {
   sb.append(
     "<li class='page-item disabled'><a class='page-link mycustom-paging' aria-disabled='true'>&gt;</a></span></li>");
  }

 }

 public int getNowPage() {
  return nowPage;
 }

 public void setNowPage(int nowPage) {
  this.nowPage = nowPage;
  // 현재 페이지 값이 바뀌는 세터이므로 표현할 게시물들이 변경되는걸 수행하도록 한다
  // 즉 begin과 end값이 바뀌므로 db로부터 가져와야한다

  // 현재 페이지 값은 총 페이지 값을 넘길 수 없다
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 각 페이지의 시작 레코드(begin)과 마지막(end)를 지정하자
  // 현재 페이지가 1이면 begin=1/end=10
  // 현재 페이지가 2이면 begin=11/end=20
  // 현재 페이지가 3이면 begin=21/end=30
  // 현재 페이지가 4이면 begin=31/end=40
  this.begin = (nowPage - 1) * numPerPage + 1;
  this.end = nowPage * numPerPage;

  // 현재 페이지 값에 의해 블럭의 시작페이지를 구하자
  this.startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
  // 페이지 블럭 처음 시작페이지가 1,6,11,16형식으로 나가도록 함

  // 블럭의 마지막 페이지 값 구하기
  this.endPage = startPage + pagePerBlock - 1;
  // 위에서 구한 endPage값이 전체 페이지 전체 페이지 수보다 클때가 우려됨
  if (endPage > totalPage)
   this.endPage = totalPage;

 }

 public int getNumPerPage() {
  return numPerPage;
 }

 public void setNumPerPage(int numPerPage) {
  this.numPerPage = numPerPage;
 }

 public long getTotalRecord() {
  return totalRecord;
 }

 public void setTotalRecord(Long totalRecord) {
  this.totalRecord = totalRecord;
  // 총 게시물 수가 정해지면 자동적으로 총 페이지 수를 구하자

  // this.totalPage = totalRecord/numPerPage;
  // // 토탈 레코드가 52고 넘퍼페이지가 10이면 나머지가 2가 남기떄문에
  // if(totalRecord%numPerPage!=0)
  // ++totalPage;
  totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
  // math.ceil은 더블로 받고 더블로 주는데 가장 가까운 높은 값의 정수를 반환한다 5.2>>6
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
