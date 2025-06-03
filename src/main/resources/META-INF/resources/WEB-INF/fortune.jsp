<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="nav.fortune"/></title>

    <style>
        /* --------------------------------------------------
           🔨 글로벌 리셋 및 기본 폰트
        -------------------------------------------------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }

        /* --------------------------------------------------
           🖌 Body 배경: Gros Michel 스타일 그라데이션
        -------------------------------------------------- */
        body {
            background: linear-gradient(135deg, #fffef7 0%, #fefcf0 50%, #fdf8e1 100%);
            min-height: 100vh;
            color: #333;
            margin: 0;
            padding: 40px 0;
        }

        /* --------------------------------------------------
           📦 페이지를 감싸는 컨테이너
        -------------------------------------------------- */
        .container {
            max-width: 768px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
            padding: 30px;
        }

        /* --------------------------------------------------
           🏷 타이틀 스타일
        -------------------------------------------------- */
        h2 {
            color: #8b6914; /* 짙은 브라운 */
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid rgba(244, 224, 77, 0.4);
            padding-bottom: 10px;
        }

        /* --------------------------------------------------
           🗓 레이블 및 입력 필드
        -------------------------------------------------- */
        label, .form-group label {
            display: block;
            font-weight: 600;
            color: #8b6914;
            margin-bottom: 5px;
        }

        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid rgba(244, 224, 77, 0.4);
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.9);
            font-size: 14px;
            color: #333;
        }

        /* --------------------------------------------------
           🔘 버튼 스타일
        -------------------------------------------------- */
        button {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: background 0.2s;
        }
        button:hover {
            background: linear-gradient(135deg, #f7e83b, #f4e04d);
        }

        /* --------------------------------------------------
           📏 구분선 스타일
        -------------------------------------------------- */
        hr {
            border: 0;
            height: 1px;
            background-color: #eee;
            margin: 25px 0;
        }

        /* --------------------------------------------------
           📊 결과를 보여주는 박스
        -------------------------------------------------- */
        .result-box {
            background: rgba(255, 254, 247, 0.8);
            border: 1px solid #f4e04d;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
            color: #333;
        }
        .result-box h3 {
            color: #8b6914;
            margin-bottom: 10px;
            font-size: 18px;
        }
        .result-box p {
            font-size: 16px;
            line-height: 1.8;
        }

        /* --------------------------------------------------
           ← 뒤로가기 버튼
        -------------------------------------------------- */
        .back-btn {
            display: inline-block;
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: background 0.2s;
        }
        .back-btn:hover {
            background: linear-gradient(135deg, #f7e83b, #f4e04d);
        }
    </style>
</head>
<body>
<div class="container">
    <!-- ✅ 뒤로가기 버튼 -->
    <button class="back-btn" onclick="location.href='/project1/template'">
        ← <spring:message code="fortune.back"/>
    </button>

    <h2><spring:message code="nav.fortune"/></h2>

    <!-- ✅ form 방식 -->
    <form method="get" action="${pageContext.request.contextPath}/getFortune">
        <spring:message code="fortune.date"/>:
        <input type="date" name="date" value="<%= java.time.LocalDate.now() %>" />
        <button type="submit"><spring:message code="fortune.check"/></button>
    </form>

    <hr>

    <!-- ✅ JSP 결과 출력 -->
    <c:if test="${not empty fortune}">
        <div class="result-box">
            <h3>
                <spring:message code="fortune.result.title">
                    <spring:argument value="${date}"/>
                </spring:message>
            </h3>
            <p>${fortune}</p>
        </div>
    </c:if>

    <!-- ✅ JS fetch 결과 출력 -->
    <div id="result" class="result-box" style="display:none;"></div>
</div>

<script>
    function getFortune() {
        const date = document.getElementById("dateInput").value;
        fetch("${pageContext.request.contextPath}/api/fortune?date=" + date)
            .then(res => {
                if (!res.ok) throw new Error("HTTP error " + res.status);
                return res.json();
            })
            .then(data => {
                const resultDiv = document.getElementById("result");
                resultDiv.innerHTML = `<h3>📅 ${data.date} <spring:message code="fortune.result.label"/></h3><p>${data.fortune}</p>`;
                resultDiv.style.display = "block";
            })
            .catch(err => {
                document.getElementById("result").innerText = "❌ <spring:message code='fortune.error'/>: " + err;
            });
    }
</script>
</body>
</html>
