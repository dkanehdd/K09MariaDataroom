package util;

public class PagingUtil {
	
	public static String pagingBS4(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		String pagingStr = "";
		//전체 페이지수 계산
		int totalPage = (int)(Math.ceil((double)totalRecordCount/pageSize));
		/*
		계산식] ((현재페이지-1) / BLOCK_PAGE) * BLOCK_PAGE+ 1
			현재페이지가
			1페이지일때 intTemp = ((1-1) / 5) * 5 + 1 = 1
			5페이지일때 intTemp = ((5-1) / 5) * 5 + 1 = 1
		intTemp가 1일때는 이전페이지 블록 이미지가 노출되지 않는다.
			6페이지일때 intTemp = ((6-1) / 5) * 5 + 1 = 6
			10페이지일때 intTemp = ((10-1) / 5) * 5 + 1 = 6
		1이 아닐때는 intTemp-BLOCK_PAGE 결과로 이전페이지 블록의 링크를 설정한다. 
		*/
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		
		//1~5페이지인경우 이전블럭이 존재하지 않으므로 아이콘을 출력하지 않는다.
		if(intTemp != 1) {
			//무조건 첫페이지로(페이지번호를 1로 설정한다.)
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage=1'"
					+ " class='page-link'>"
					+ "<i class=\"fas fa-angle-double-left\"></i></a></li>";
			//이전블록으로
			pagingStr += "<li class='page-item'><a href='"+pageName+"nowPage="+
						(intTemp-1)+"' class='page-link'>"
					+ "<i class=\"fas fa-angle-left\"></i></a></li>";
		}
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage) {
			//페이지 바로가기(현재 BLOCK_PAGE가 5로 설정되므로 5개씩 페이지번호가 출력된다)
			if(intTemp==nowPage) {
				//현재페이지인경우 active속성을 주고 href속성을 없앤다
				pagingStr += "<li class='page-item active'><a href='#' class='page-link'>"
			  +intTemp+"</a></li>";
			}
			else {
				//현재페이지가 아닌경우 
				pagingStr += "<li class='page-item'><a href='" + pageName
						+ "nowPage="+intTemp+"' class='page-link'>"+ intTemp+"</a></li>";
			}
			intTemp++;
			blockCount++;
		}
		
		if(intTemp <= totalPage) {
			//다음 페이지 블록으로 이동
			pagingStr += "<li class='page-item'><a href='"+pageName + "nowPage="+ intTemp+"'"
					+ " class='page-link'>"
					+ "<i class=\"fas fa-angle-right\"></i></a></li>";
			//totalPage를 이용 마지막 페이지로 
			pagingStr+= "<li class='page-item'><a href='"+pageName+"nowPage="+totalPage+"'"
							+ " class='page-link'>"
					+ "<i class=\"fas fa-angle-double-right\"></i></a></li>";
		}
		return pagingStr;
	}
	
	public static String pagingImg(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";

		int totalPage =	(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		
		if(intTemp != 1) {
			pagingStr += "<a href='"+pageName+"nowPage=1'><img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+(intTemp-1)+"'><img src='../images/paging2.gif'></a>";
		}

		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage)
		{
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;";
				pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>"+intTemp+"</a>";
				pagingStr += "&nbsp;";
			}
			intTemp++;
			blockCount++;
		}

		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'><img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+totalPage+"'><img src='../images/paging4.gif'></a>";
		}

		return pagingStr;
	}

	//페이지번호를 순수 텍스트로 표현한다.
	public static String pagingTxt(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		//전체 페이수 계산
		int totalPage =	(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		//페이지블럭 상태를 표현하기 위한 계산식
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		
		/*첫번째페이지 블럭이라면 표시하지 않는다. <, <<*/
		if(intTemp != 1) {
			pagingStr += "<a href='"+pageName+"nowPage=1'>[첫페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+(intTemp-1)+"'>[이전블럭으로]</a>";
		}

		int blockCount = 1;
		/*각 페이지 바로가기 BLOCK_PAGE의 설정값만큼 반복한다.
		 BLOCK_PAGE의 설정값만큼 반복하는것을 기본으로 하지만,
		 전체페이지를 넘어갈수는 없으므로 남은 페이지만큼만 반복하기위해 두번째조건을 추가 
		 */
		while(blockCount<=blockPage && intTemp<=totalPage)
		{
			//현제페이지 일때는 a태그를 뺀당
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			//현제페이지가 아닐때는 링크를 걸어준다.
			else {
				pagingStr += "&nbsp;";
				pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>"+intTemp+"</a>";
				pagingStr += "&nbsp;";
			}
			intTemp++;
			blockCount++;
		}

		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>[다음블럭으로]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+totalPage+"'>[마지막페이지]</a>";
		}

		return pagingStr;
	}
}
