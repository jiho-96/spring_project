<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문페이지</title>

    <link href="${pageContext.request.contextPath}/resources/common/styles.css" rel="stylesheet">
    <!-- jQuery cdn -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <style>
        .red {
            color: red;
        }
    </style>
</head>
<body>
<!-- Page Header Start -->
<div class="container-fluid">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">주문/결제</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="#">천재교육</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">주문페이지</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <div class="card-header border-0" style="background-color: #EDF1FF; padding: 10px 0px; padding-left: 10px;
                    border-top-left-radius: 5px; border-top-right-radius: 5px;">
                    <h4 class="font-weight-semi-bold m-0">
                        배송지 입력
                    </h4>
                </div>

                <form:form modelAttribute="orderProductForm" method="post" action="/cart/order">
                    <input type="hidden" name="cartIdx" value="${cartIdx}"/>
                    <div style="margin-top: 15px;">
                        <div class="form-group">
                            <label>수취인</label>
                            <form:input path="orderName" class="form-control" type="text"
                                        placeholder="이름을 입력해주세요"/>
                            <form:errors path="orderName" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>이메일</label>
                            <form:input path="orderEmail" class="form-control" type="text"
                                        placeholder="이메일을 입력해주세요"/>
                            <form:errors path="orderEmail" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>전화번호</label>
                            <form:input path="orderPhone" class="form-control" type="text"
                                        placeholder="숫자만 입력해주세요"/>
                            <form:errors path="orderPhone" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>우편번호</label>
                            <form:input path="zipcode" class="form-control" type="text"
                                        placeholder="우편번호 검색을 클릭해주세요" readonly="true"/>
                            <form:errors path="zipcode" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>주소</label>
                            <form:input path="orderAddress1" class="form-control" type="text"
                                        placeholder="우편번호 검색을 통해 입력되게 해주세요" readonly="true"/>
                            <form:errors path="orderAddress1" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>상세주소</label>
                            <form:input path="orderAddress2" class="form-control" type="text"
                                        placeholder="동/호수 등 상세주소를 입력해주세요"/>
                            <form:errors path="orderAddress2" cssClass="red"/>
                        </div><br/>
                        <div class="form-group">
                            <label>배송요청사항</label>
                            <form:select path="orderRequest" class="form-control">
                                <option value="op-none">주문 요청사항 선택</option>
                                <option value="op-text">배송 전 문자 남겨주세요</option>
                                <option value="op-call">배송 전 전화 해주세요</option>
                                <option value="op-security">경비실에 맡겨주세요</option>
                            </form:select><br/>
                        </div>
                    </div>
                </form:form>
            </div>


            <div style="margin-top: 2.5rem;">
                <!-- 여기서부터 장바구니 한 개 시작 -->
                <div>
                    <h5 class="seller-name">판매자 이름: []</h5>
                    <div>
                        <div class="table-responsive mb-5">
                            <table class="table table-bordered text-center mb-0">
                                <thead class="text-dark" style="background-color: #EDF1FF">
                                <tr>
                                    <th>상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">
                                <tr>
                                    <td class="align-middle"><img src="" alt=""
                                                                  style="width: 100px; height: 100px;"> Colorful Stylish
                                        Shirt
                                    </td>
                                    <td class="align-middle">$150</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <input type="text"
                                                   class="form-control form-control-sm text-center"
                                                   value="1" readonly>
                                        </div>
                                    </td>
                                    <td class="align-middle">$150</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header border-0" style="background-color: #EDF1FF">
                    <h4 class="font-weight-semi-bold m-0">주문 요약</h4>
                </div>
                <div class="card-body">

                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">상품</h6>
                        <h6 class="font-weight-medium">$150</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">배송</h6>
                        <h6 class="font-weight-medium">$10</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">합계</h5>
                        <h5 class="font-weight-bold">$160</h5>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-5">
                <div class="card-header border-0" style="background-color: #EDF1FF">
                    <h4 class="font-weight-semi-bold m-0">결제수단</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="checkbox" class="custom-control-input" name="payment" id="point" checked
                                   disabled>
                            <label class="custom-control-label" for="point">포인트</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <button class="btn btn-primary font-weight-bold" style="width: 100%;" id="submit-btn">주문하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->
</body>
<script>
    $('#submit-btn').on('click', function () {
        $('#orderProductForm').submit();
    })
</script>
</html>