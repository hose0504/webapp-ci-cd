<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="login.title" /></title>
    <style>
      <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕", Helvetica, Arial, sans-serif;
            background: linear-gradient(135deg, #f9d71c 0%, #ddb642 50%, #27ae60 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }
        
        /* 바나나 패턴 배경 */
        body::before {
            content: '🍌';
            position: absolute;
            top: 10%;
            left: 15%;
            font-size: 60px;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }
        
        body::after {
            content: '🍌';
            position: absolute;
            bottom: 20%;
            right: 10%;
            font-size: 40px;
            opacity: 0.1;
            animation: float 4s ease-in-out infinite reverse;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            padding: 50px 40px;
            width: 100%;
            max-width: 420px;
            border: 3px solid #f9d71c;
            position: relative;
        }
        
        .login-container::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, #f9d71c, #27ae60, #f9d71c, #27ae60);
            border-radius: 30px;
            z-index: -1;
            animation: gradientShift 3s ease infinite;
        }
        
        @keyframes gradientShift {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }
        
        .logo {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .logo .banana-icon {
            font-size: 80px;
            margin-bottom: 15px;
            display: block;
            animation: swing 2s ease-in-out infinite;
        }
        
        @keyframes swing {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(10deg); }
            75% { transform: rotate(-10deg); }
        }
        
        .logo h1 {
            font-size: 36px;
            font-weight: 800;
            background: linear-gradient(135deg, #f9d71c, #e67e22);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 8px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .logo p {
            color: #8b7355;
            font-size: 16px;
            font-weight: 500;
        }
        
        .login-form {
            width: 100%;
        }
        
        .form-group {
            position: relative;
            margin-bottom: 25px;
        }
        
        .form-group::before {
            content: '🍌';
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            z-index: 1;
        }
        
        .form-group:nth-child(2)::before {
            content: '🔒';
        }
        
        .form-group input {
            width: 100%;
            padding: 18px 20px 18px 50px;
            border: 3px solid #f9d71c;
            border-radius: 15px;
            font-size: 16px;
            background: #fffef7;
            transition: all 0.3s ease;
            outline: none;
        }
        
        .form-group input:focus {
            border-color: #e67e22;
            background: white;
            box-shadow: 0 0 0 5px rgba(249, 215, 28, 0.2);
            transform: translateY(-2px);
        }
        
        .form-group input::placeholder {
            color: #d4af37;
            font-weight: 500;
        }
        
        .error-msg {
            background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
            color: white;
            padding: 15px 20px;
            border-radius: 12px;
            font-size: 14px;
            margin-bottom: 25px;
            border-left: 5px solid #ff4757;
            display: ${empty msg ? 'none' : 'block'};
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }
        
        .btn-group {
            margin-top: 35px;
        }
        
        .btn {
            width: 100%;
            padding: 18px;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 15px;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            transition: left 0.6s;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #f9d71c, #e67e22);
            color: #2c1810;
            box-shadow: 0 10px 20px rgba(249, 215, 28, 0.4);
            border: 3px solid #ddb642;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(249, 215, 28, 0.6);
            background: linear-gradient(135deg, #ffd93d, #ff8c42);
        }
        
        .btn-primary:active {
            transform: translateY(-1px);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: 3px solid #229954;
            box-shadow: 0 8px 16px rgba(39, 174, 96, 0.3);
        }
        
        .btn-secondary:hover {
            background: linear-gradient(135deg, #2ecc71, #58d68d);
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(39, 174, 96, 0.4);
        }
        
        .banana-divider {
            text-align: center;
            margin: 35px 0;
            position: relative;
            color: #d4af37;
            font-weight: 600;
        }
        
        .banana-divider::before,
        .banana-divider::after {
            content: '🍌🍌🍌';
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 12px;
            opacity: 0.6;
        }
        
        .banana-divider::before {
            left: 0;
        }
        
        .banana-divider::after {
            right: 0;
        }
        
        .fun-facts {
            background: linear-gradient(135deg, #fff9e6, #fff3cd);
            padding: 20px;
            border-radius: 15px;
            margin-top: 25px;
            border: 2px solid #f9d71c;
            text-align: center;
        }
        
        .fun-facts h3 {
            color: #d4af37;
            font-size: 16px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .fun-facts p {
            color: #8b7355;
            font-size: 13px;
            line-height: 1.4;
        }
        
        .loading {
            display: none;
            width: 20px;
            height: 20px;
            border: 3px solid #f9d71c;
            border-top: 3px solid #e67e22;
            border-radius: 50%;
            animation: bananaSpinning 1s linear infinite;
            margin-right: 10px;
        }
        
        @keyframes bananaSpinning {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 40px 25px;
                margin: 15px;
            }
            
            .logo .banana-icon {
                font-size: 60px;
            }
            
            .logo h1 {
                font-size: 28px;
            }
        }
        
        /* 추가 바나나 장식 */
        .floating-banana {
            position: absolute;
            font-size: 25px;
            opacity: 0.1;
            animation: floatRandom 8s ease-in-out infinite;
        }
        
        .floating-banana:nth-child(1) {
            top: 5%;
            right: 25%;
            animation-delay: -2s;
        }
        
        .floating-banana:nth-child(2) {
            bottom: 15%;
            left: 20%;
            animation-delay: -4s;
        }
        
        .floating-banana:nth-child(3) {
            top: 60%;
            right: 5%;
            animation-delay: -6s;
        }
        
        @keyframes floatRandom {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            25% { transform: translate(10px, -15px) rotate(90deg); }
            50% { transform: translate(-5px, -25px) rotate(180deg); }
            75% { transform: translate(-15px, -10px) rotate(270deg); }
        }
    </style>
    </style>
</head>
<body>
    <div class="floating-banana">🍌</div>
    <div class="floating-banana">🍌</div>
    <div class="floating-banana">🍌</div>
    
    <div class="login-container">
        <div class="logo">
            <span class="banana-icon">🍌</span>
            <h1>BANANA TEAM5</h1>
            <p>바나나처럼 달콤한 로그인!</p>
        </div>
        
        <div class="error-msg">
            🚫 ${msg}
        </div>
        
        <form action="/login" method="post" id="loginForm" class="login-form">
            <div class="form-group">
                <input type="text" 
                       name="id" 
                       placeholder="🍌 <spring:message code='login.id'/>" 
                       id="id"
                       autocomplete="username">
            </div>
            
            <div class="form-group">
                <input type="password" 
                       name="password" 
                       placeholder="🔐 <spring:message code='login.password'/>" 
                       id="password"
                       autocomplete="current-password">
            </div>
            
            <div class="btn-group">
                <button type="button" class="btn btn-primary" onclick="loginCheck()">
                    <span class="loading" id="loading"></span>
                    🍌 <spring:message code='login.submit'/>
                </button>
                <button type="button" class="btn btn-secondary" onclick="location.href='http://www.team5.click/project1/template'">
                    🏠 <spring:message code='login.cancel'/>
                </button>
            </div>
        </form>
        
        <div class="banana-divider">
            <span>바나나 존 입장</span>
        </div>
        
        <div class="fun-facts">
            <h3>🍌 바나나 팩트!</h3>
            <p>바나나는 베리류에 속하며, 하루 권장 칼륨의 12%를 제공합니다. TEAM5와 함께 건강한 코딩하세요!</p>
        </div>
    </div>

    <script>
        function loginCheck() {
            var id = document.getElementById("id").value.trim();
            var pw = document.getElementById("password").value.trim();
            var loading = document.getElementById("loading");
            
            if (!id) {
                showBananaAlert("🍌 <spring:message code='alert.id.required'/>", "id");
                return;
            }
            if (!pw) {
                showBananaAlert("🔒 <spring:message code='alert.pw.required'/>", "password");
                return;
            }
            
            loading.style.display = "inline-block";
            
            setTimeout(function() {
                document.getElementById("loginForm").submit();
            }, 800);
        }
        
        function showBananaAlert(message, focusId) {
            alert(message);
            if (focusId) {
                document.getElementById(focusId).focus();
            }
        }
        
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                loginCheck();
            }
        });
        
        // 바나나 입력 이펙트
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.style.borderColor = '#e67e22';
                this.parentElement.style.transform = 'scale(1.02) rotate(0.5deg)';
            });
            
            input.addEventListener('blur', function() {
                this.style.borderColor = '#f9d71c';
                this.parentElement.style.transform = 'scale(1) rotate(0deg)';
            });
        });
        
        // 랜덤 바나나 이모지 생성
        setInterval(function() {
            if (Math.random() < 0.3) {
                createFlyingBanana();
            }
        }, 3000);
        
        function createFlyingBanana() {
            var banana = document.createElement('div');
            banana.innerHTML = '🍌';
            banana.style.position = 'fixed';
            banana.style.fontSize = '20px';
            banana.style.opacity = '0.3';
            banana.style.left = Math.random() * window.innerWidth + 'px';
            banana.style.top = '-50px';
            banana.style.animation = 'fall 4s linear forwards';
            banana.style.zIndex = '-1';
            document.body.appendChild(banana);
            
            setTimeout(function() {
                banana.remove();
            }, 4000);
        }
        
        // CSS 애니메이션 추가
        var style = document.createElement('style');
        style.textContent = `
            @keyframes fall {
                to {
                    transform: translateY(calc(100vh + 50px)) rotate(360deg);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>