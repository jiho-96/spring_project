<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <title>paging</title>
    <jsp:include page="#"/>
    <script>
        const savefn = () => {
            const productIdx = '${productReview.productIdx}';
            location.href = "/product/review/save";
        }
    </script>
</head>
<body class="bg-light">
<div class="container mt-3">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>번호</th>
            <th>리뷰사진</th>
            <th>작성자</th>
            <th>내용</th>
            <th>별점</th>
            <th>작성시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagingList}" var="review">
            <tr onclick="location.href='/product/review?reviewIdx=${review.reviewIdx}'" style="cursor: pointer;">
                <td>${review.reviewIdx}</td>
                <c:set var="reviewDate" value="${fn:substring(review.reviewDate, 0, 10)}" />
                <td><img src="/review/${reviewDate}/${review.reviewThumbSaved}" alt="리뷰 이미지" class="img-fluid"></td>
                <td>${review.customerIdx}</td>
                <td>
                    <c:choose>
                        <c:when test="${fn:length(review.reviewContent) gt 50}">
                            <c:out value="${fn:substring(review.reviewContent, 0, 50)}....."/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${review.reviewContent}"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${review.reviewStar}</td>
                <td>${review.reviewDateStr}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="container mt-3">
    <ul class="pagination">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <span class="page-link">이전</span>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/product/review/paging?page=${paging.page-1}" aria-label="Previous">
                        이전
                    </a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <span class="page-link">${i}</span>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/product/review/paging?page=${i}">
                                ${i}
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <span class="page-link">다음</span>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/product/review/paging?page=${paging.page+1}" aria-label="Next">
                        다음
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
    <button class="btn btn-warning" onclick="savefn()">리뷰 등록</button>
</div>
</body>
</html>