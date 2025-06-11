<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gros Michel</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #fffef7 0%, #fefcf0 50%, #fdf8e1 100%);
            min-height: 100vh;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        
        header {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(244, 224, 77, 0.3);
        }
        
        .logo {
            color: #8b6914;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }
        
        .nav {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            padding: 10px 20px;
            box-shadow: 0 2px 8px rgba(244, 224, 77, 0.2);
        }
        
        .nav .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .nav-links {
            display: flex;
            list-style: none;
            margin: 0 auto;
        }
        
        .nav-links li {
            margin: 0 20px;
        }
        
        .nav-links a {
            text-decoration: none;
            color: #8b6914;
            font-weight: 500;
        }
        
        .login-link {
            text-decoration: none;
            color: #c49a1a;
            font-weight: 600;
        }
        
        main {
            display: flex;
            padding: 20px;
        }
        
        .content {
            flex: 3;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
        }
        
        .sidebar {
            flex: 1;
            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }
        
        .login-form, .weather-widget {
            width: 100%;
            max-width: 300px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .login-form h3, .weather-widget h3 {
            font-size: 18px;
            margin-bottom: 15px;
            color: #8b6914;
        }
        
        .form-group {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .form-group button {
            width: 100%;
            padding: 10px;
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #8b6914;
        }
        
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid rgba(244, 224, 77, 0.4);
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.9);
        }
        
        .signup-link {
            font-size: 12px; 
            color: #8b6914; 
            text-decoration: none; 
            margin-top: 10px;
        }
        
        .signup-link:hover, 
        .signup-link:active, 
        .signup-link:visited {
            color: #c49a1a; 
            text-decoration: none; 
        }

        .news-section h3 {
            color: #8b6914;
            margin-bottom: 15px;
        }
        
        .news-item {
            background: rgba(255, 250, 240, 0.6);
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            border-left: 3px solid #f4e04d;
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }

        .news-image {
            width: 120px;
            height: 80px;
            border-radius: 6px;
            object-fit: cover;
            flex-shrink: 0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .news-content-wrapper {
            flex: 1;
        }

        .news-meta {
            font-size: 12px;
            color: #8b6914;
            margin-top: 8px;
            opacity: 0.8;
        }
        
        footer {
            background: linear-gradient(135deg, #8b6914, #c49a1a);
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 20px;
        }
        
        .hidden {
            display: none;
        }
        
        .help-link {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #8b6914;
            font-weight: 600;
            text-decoration: none;
            font-size: 16px;
        }
        
        .help-link:hover {
            text-decoration: underline;
            color: #c49a1a;
        }

    </style>
</head>
<body>
<header>
    <div class="container" style="position: relative;">
        <div class="logo">Gros Michel</div>
        <a href="/project1/chatbot" class="help-link">Help</a>
    </div>
</header>

<nav class="nav">
    <div class="container">
        <div class="empty-space"></div>
        <ul class="nav-links">
  <li><a href="template" onclick="showSection('home')">Home</a></li>
  <li><a href="community" onclick="showSection('community')">Community</a></li>
  <li><a href="weather" onclick="showSection('weather')">Weather</a></li>
  <li><a href="fortune">Fortune</a></li>
  <li><a href="campaign">Campaign</a></li>
  <li><a href="information">Information</a></li>
  <li><a href="shop">Shop</a></li>
</ul>
<a href="login" class="login-link" onclick="return login()">Login</a>
<button onclick="location.href='http://www.team5.click/project1/Mypage'">My Page</button>
</nav>

<div class="container">
    <main>
        <div class="content">
            <div id="home-section">
                <h2><spring:message code="home.title"/></h2>
                <p><spring:message code="welcome.message"/></p>
                <div class="news-section">
                    <h3>그로미셸 바나나</h3>
                    <div class="news-item">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAyMTA5MDFfMTUx/MDAxNjMwNDcxMTM5MjYw.tXMbGQY71Cb1hVqSJ7o7PfVTnQbWwmbM91pYVnT6ojMg.IbZXSEGVXn7BOBzdxM2QioUdPhaf92zSvuG3jOB6Y5wg.JPEG.sr3d/sr3d_%EA%B7%B8%EB%A1%9C%EB%AF%B8%EC%85%80_12.jpg?type=w800" 
                             alt="그로미셸 바나나" class="news-image">
                        <div class="news-content-wrapper">
                            <a href="/project1/news" style="text-decoration: none; color: inherit;">
                                <div class="news-block" style="cursor: pointer;">
                                    <h4>그로미셸 바나나의 역사와 현재</h4>
                                    <p>한때 세계에서 가장 인기 있던 바나나 품종이었던 그로미셸 바나나의 흥미로운 이야기를 알아보세요. 파나마병으로 인해 사라진 이 바나나는 현재 우리가 먹는 캐번디시 바나나와는 다른 독특한 맛을 가지고 있었습니다.</p>
                                    <div class="news-meta">과학뉴스 · 2025-05-29</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="news-content hidden" id="news-detail">
                        <a href="/project/news" class="back-to-news" onclick="showNewsList()">
                            <spring:message code="nav.news"/> · 목록으로 돌아가기
                        </a>
                        <div class="news-detail-header">
                            <h3 id="news-detail-title"></h3>
                            <p id="news-detail-source"></p>
                        </div>
                        <div id="news-detail-content"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="sidebar">
            <!-- 🔓 로그인하지 않은 사용자 -->
  <div class="login-form">
  <c:choose>

  <%-- 로그인 안 된 경우 --%>
  <c:when test="${empty sessionScope.id}">
    <div class="login-box">
      <h3><spring:message code="login.title"/></h3>
      <a href="${pageContext.request.contextPath}/login">
        <spring:message code="login"/>
      </a>
      <a href="${pageContext.request.contextPath}/regist">
        <spring:message code="signup"/>
      </a>
    </div>
  </c:when>

  <%-- 로그인 된 경우 --%>
  <c:otherwise>
    <div class="welcome-box">
      <h3>안녕하세요, <strong>${sessionScope.id}</strong>님!</h3>
      <form action="${pageContext.request.contextPath}/logout" method="get">
        <button type="submit">
          <spring:message code="logout"/>
        </button>
      </form>
    </div>
  </c:otherwise>

</c:choose>
</div>
            <div class="weather-widget">
                <h3><spring:message code="weather.today"/></h3>
                <p>${weatherData.date}</p>
                <div id="weather-info">
                    <p><strong><spring:message code="location.seoul"/></strong></p>
                    <div class="weather-icon">
                        ⛅ ${weatherData.temp}°C
                    </div>
                    <p><spring:message code="humidity"/>: ${weatherData.moisture}% | 
                       <spring:message code="wind"/>: ${weatherData.windSpeed}m/s</p>
                </div>
            </div>
        </div>
    </main>
</div>

<footer>
    <div class="container">
        <p>&copy; Gros Michel Web Site. All rights reserved.</p>
    </div>
</footer>

<script>
    // Existing JavaScript remains the same as in the original document
    function showSection(sectionId) {
        console.log("Show section: " + sectionId);
    }
    
    function showLoginForm() {
        console.log("Show login form");
    }
    
    function showSignupForm() {
        console.log("regist");
    }
    
    function login() {
        const username = document.getElementById("id").value;
        const password = document.getElementById("pw").value;
        
        alert("로그인 창입니다. 여기에 진짜 로그인 폼 띄우셔도 됩니다.");

        if (username === "admin" && password === "1234") {
            alert("로그인 성공!");
            window.open("http://www.team5.click/project1/login", "LoginWindow", "width=500,height=600");
        } else {
            alert("로그인 실패! 아이디 또는 비밀번호를 확인해주세요.");
        }

        return false;
    }

    function logout() {
        localStorage.removeItem("loggedIn");
        localStorage.removeItem("userName");

        document.getElementById("login-form").style.display = "block";
        document.getElementById("user-info").style.display = "none";

        alert("로그아웃 되었습니다.");
    }
</script>
</body>
</html>