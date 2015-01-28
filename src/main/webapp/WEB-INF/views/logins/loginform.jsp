<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>OMG LOGIN 화면</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="/company/resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />

    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
            <div class="header">OMG 사원 확인</div>
            <form action="login" method="post">
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="text" name="empId" class="form-control" placeholder="사원번호"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="비밀번호"/>
                    </div>
                <!--     <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Remember me	쿠키를 할수 있따면
                    </div>	 -->
                </div>
                <div class="footer">
                    <button type="submit" class="btn bg-olive btn-block">로 그 인</button>
                    <p><a href="/company/pass">패스워드 찾기</a></p>
                </div>
            </form>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>