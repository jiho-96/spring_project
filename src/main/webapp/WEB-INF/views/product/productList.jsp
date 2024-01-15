<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>

<%@ include file="./topNavigation.jsp" %>

<head>
    <title>상품목록</title>
</head>

<!-- Header-->
<header class="main-header py-5">
    <img src="${pageContext.request.contextPath}/resources/common/images/mainpage_image_bgremoved.png"
         class="character"/>
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder"></h1>
            <p class="lead fw-normal text-white-50 mb-0"></p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <c:if test="${empty productList}">
            <h1>등록된 상품이 없습니다</h1>
        </c:if>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${productList}" var="product">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="/product/${product.productThumbSaved}" alt="..."/>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <h5 class="fw-bolder">
                                    <c:out value="${product.productName}"/>
                                </h5>
                                <fmt:formatNumber value="${product.productPrice}" pattern="#,###"/> (원)
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품보러가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; 천재교육</p>
    </div>
</footer>

<script>
    const productNotExistErrorMsg = '<c:out value="${productNotExistErrorMsg}"/>';
    if (productNotExistErrorMsg) {
        alert(productNotExistErrorMsg);
    }
</script>
</body>
</html>