<%@ page language="java"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*" %>

<html>

<head>
    <title>���� �����ȸ</title>
    <meta charset="EUC-KR">
    <!-- ���� : http://getbootstrap.com/css/   ���� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />




    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- asome icon CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        image {
            border: 1px solid lightpink;
        }

        h3 {
            color: white;
            font-family: Consolas;
        }

        #flight,
        #room {
            width: 100%;
            margin: auto;
            font-size: 11pt;
        }

    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetUserList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/order/getOrderList").submit();
        }

        $(function() {
            $("button.btn.btn-default").on("click", function() {
                fncGetUserList(1);
            });
        });
        
    </script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>
        <div class="container" style="width:70%;margin: auto;">
   			 <form>
            <div class="container">

            <div class="h4 offList" style="font-family:'NIXGONM-Vb';display:inline-block;background-color:#ffde3e;font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;">
        		   �������� ���� ����
            </div>
      
    

        </div>


        <table class="table table-hover" id="flight">
            <thead>
                <tr>
                    <th scope="col">���Ӹ�</th>
                    <th scope="col">�������� ���Ӹ�</th>
                    <th scope="col">���� ���</th>
                    <th scope="col">���� ��¥</th>
                    <th scope="col">���� �ð�</th>
                    <th scope="col">������</th>
                    <th scope="col">�ο���</th>
                </tr>
            </thead>

            <tbody>

                 <c:set var="i" value="0" /> 
                <c:forEach var="offMeet" items="${list}"> 
                    <c:set var="i" value="${i+1}" /> 
                        <tr>
                         <th scope="row"> 
                             <i class="fas fa-list" id="f"></i> 
                           <input type="hidden" name="meetId" id="meetId" value="${meet.meetId}" /> 
                            <input type="hidden" name="offNo" id="offNo" value="${offMeet.offNo}" />
                            <input type="hidden" name="payNo" id="payNo" value="${payNo}" /> 
                         </th>
                        <td>${offMeet.meet.meetName} </td>
                        <td>�ƾ�2${offMeet.offName}</td>
                        <td>�ƾ�3${offMeet.offLoc}</td>
                        <td>�ƾ�4${offMeet.offTime}</td>   
                        <td>�ƾ�5${offMeet.offTime}</td>   
                         <td>            
                         <fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />��</td>
                        <td>�ƾ�5${offMeet.offMem}/${offMeet.offMax}</td>     
                     </tr> 
                 </c:forEach>
            </tbody>
        </table>

    </form>
    </div>
</body>

</html>
