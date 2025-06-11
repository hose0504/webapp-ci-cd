<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="signup.title"/></title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Malgun Gothic', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f9d71c 0%, #ddb642 30%, #27ae60 70%, #2ecc71 100%);
            min-height: 100vh;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }
        
        /* 바나나 배경 패턴 */
        body::before {
            content: '🍌';
            position: absolute;
            top: 5%;
            left: 10%;
            font-size: 80px;
            opacity: 0.08;
            animation: floatSlow 8s ease-in-out infinite;
            z-index: 0;
        }
        
        body::after {
            content: '🍌';
            position: absolute;
            bottom: 10%;
            right: 15%;
            font-size: 60px;
            opacity: 0.08;
            animation: floatSlow 6s ease-in-out infinite reverse;
            z-index: 0;
        }
        
        @keyframes floatSlow {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-30px) rotate(10deg); }
        }
        
        .floating-bananas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }
        
        .floating-banana {
            position: absolute;
            font-size: 20px;
            opacity: 0.1;
            animation: floatRandom 12s ease-in-out infinite;
        }
        
        .floating-banana:nth-child(1) { top: 15%; left: 5%; animation-delay: -2s; }
        .floating-banana:nth-child(2) { top: 25%; right: 8%; animation-delay: -4s; }
        .floating-banana:nth-child(3) { top: 45%; left: 12%; animation-delay: -6s; }
        .floating-banana:nth-child(4) { top: 65%; right: 20%; animation-delay: -8s; }
        .floating-banana:nth-child(5) { top: 80%; left: 25%; animation-delay: -10s; }
        
        @keyframes floatRandom {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            25% { transform: translate(15px, -20px) rotate(90deg); }
            50% { transform: translate(-10px, -35px) rotate(180deg); }
            75% { transform: translate(-20px, -15px) rotate(270deg); }
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 3px solid #f9d71c;
        }
        
        .header::before {
            content: '🍌';
            font-size: 60px;
            display: block;
            margin-bottom: 15px;
            animation: swing 3s ease-in-out infinite;
        }
        
        @keyframes swing {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(15deg); }
            75% { transform: rotate(-15deg); }
        }
        
        .header h1 {
            font-size: 32px;
            font-weight: 800;
            background: linear-gradient(135deg, #f9d71c, #e67e22);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 8px;
        }
        
        .header p {
            color: #8b7355;
            font-size: 16px;
            font-weight: 500;
        }
        
        .signup-form {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 3px solid #f9d71c;
            position: relative;
        }
        
        .signup-form::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(45deg, #f9d71c, #27ae60, #f9d71c, #27ae60);
            border-radius: 30px;
            z-index: -1;
            animation: gradientShift 4s ease infinite;
        }
        
        @keyframes gradientShift {
            0%, 100% { opacity: 0.6; }
            50% { opacity: 1; }
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
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-input {
            width: 100%;
            padding: 16px 20px 16px 50px;
            border: 3px solid #f9d71c;
            border-radius: 15px;
            font-size: 16px;
            background: #fffef7;
            transition: all 0.3s ease;
            outline: none;
        }
        
        .form-input:focus {
            border-color: #e67e22;
            background: white;
            box-shadow: 0 0 0 5px rgba(249, 215, 28, 0.2);
            transform: translateY(-2px);
        }
        
        .form-input::placeholder {
            color: #d4af37;
            font-weight: 500;
        }
        
        /* 입력 필드별 아이콘 */
        .form-group:nth-child(1)::before { content: '👤'; }
        .form-group:nth-child(2)::before { content: '🔒'; }
        .form-group:nth-child(3)::before { content: '🔐'; }
        .form-group:nth-child(4)::before { content: '📝'; }
        .form-group:nth-child(5)::before { content: '📮'; }
        .form-group:nth-child(6)::before { content: '🏠'; }
        .form-group:nth-child(7)::before { content: '🏡'; }
        .form-group:nth-child(8)::before { content: '📱'; }
        
        .form-group::before {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            z-index: 1;
        }
        
        .address-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        
        .address-group .form-input {
            flex: 1;
        }
        
        .btn-find-zip {
            padding: 16px 20px;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
            font-size: 14px;
        }
        
        .btn-find-zip:hover {
            background: linear-gradient(135deg, #2ecc71, #58d68d);
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(39, 174, 96, 0.3);
        }
        
        .password-match {
            margin-top: 8px;
            font-size: 14px;
            font-weight: 600;
        }
        
        .match-success {
            color: #27ae60;
        }
        
        .match-error {
            color: #e74c3c;
        }
        
        .required-label {
            color: #e67e22;
            font-size: 12px;
            margin-top: 5px;
            font-weight: 600;
        }
        
        .button-group {
            margin-top: 35px;
            display: flex;
            gap: 15px;
        }
        
        .btn {
            flex: 1;
            padding: 18px;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
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
        
        .banana-tips {
            background: linear-gradient(135deg, #fff9e6, #fff3cd);
            padding: 20px;
            border-radius: 15px;
            margin-top: 25px;
            border: 2px solid #f9d71c;
            text-align: center;
        }
        
        .banana-tips h3 {
            color: #d4af37;
            font-size: 16px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .banana-tips p {
            color: #8b7355;
            font-size: 13px;
            line-height: 1.5;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .signup-form {
                padding: 25px;
            }
            
            .address-group {
                flex-direction: column;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .header h1 {
                font-size: 24px;
            }
        }
        
        /* 성공 애니메이션 */
        @keyframes successPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .success-animation {
            animation: successPulse 0.6s ease-in-out;
        }
    </style>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body>
    <div class="floating-bananas">
        <div class="floating-banana">🍌</div>
        <div class="floating-banana">🍌</div>
        <div class="floating-banana">🍌</div>
        <div class="floating-banana">🍌</div>
        <div class="floating-banana">🍌</div>
    </div>

    <div class="container">
        <div class="header">
            <h1>🍌 BANANA TEAM5 가입</h1>
            <p>바나나 패밀리에 합류하세요!</p>
        </div>
        
        <div class="signup-form">
            <div class="error-msg">
                🚫 ${msg}
            </div>
            
            <form action="/regist" method="post" id="f">
                <div class="form-group">
                    <input type="text" name="id" placeholder="🍌 <spring:message code='signup.id'/>" id="id" class="form-input">
                    <div class="required-label">* <spring:message code='required'/></div>
                </div>

                <div class="form-group">
                    <input type="password" name="pw" placeholder="🔒 <spring:message code='signup.password'/>" id="pw" class="form-input">
                </div>
                
                <div class="form-group">
                    <input type="password" name="confirm" placeholder="🔐 <spring:message code='signup.confirm'/>" id="confirm" class="form-input" onchange="pwCheck()">
                    <div id="label" class="password-match"></div>
                </div>

                <div class="form-group">
                    <input type="text" name="userName" id="userName" placeholder="📝 <spring:message code='signup.name'/>" class="form-input">
                </div>

                <div class="form-group">
                    <div class="address-group">
                        <input type="text" name="postcode" id="sample6_postcode" placeholder="📮 <spring:message code='signup.zipcode'/>" class="form-input">
                        <button type="button" class="btn-find-zip" onclick="sample6_execDaumPostcode()">
                            🔍 <spring:message code='signup.findzipcode'/>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <input type="text" name="address" id="sample6_address" placeholder="🏠 <spring:message code='signup.address'/>" class="form-input">
                </div>
                
                <div class="form-group">
                    <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="🏡 <spring:message code='signup.address.detail'/>" class="form-input">
                </div>

                <div class="form-group">
                    <input type="text" name="mobile" id="mobile" placeholder="📱 <spring:message code='signup.mobile'/>" class="form-input">
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-primary" onclick="allCheck()">
                        🍌 <spring:message code='signup.submit'/>
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='http://www.team5.click/project1/template'">
                        🏠 <spring:message code='signup.cancel'/>
                    </button>
                </div>
            </form>
            
            <div class="banana-tips">
                <h3>🍌 바나나 가입 팁!</h3>
                <p>바나나처럼 달콤한 우리 커뮤니티에서 건강한 소통을 즐겨보세요. 개인정보는 바나나만큼 안전하게 보호됩니다!</p>
            </div>
        </div>
    </div>

    <script>
        const messages = {
            idRequired: "🍌 <spring:message code='alert.id.required'/>",
            pwRequired: "🔒 <spring:message code='alert.pw.required'/>",
            pwMismatch: "🚫 <spring:message code='alert.pw.mismatch'/>",
            nameRequired: "📝 <spring:message code='alert.name.required'/>",
            zipcodeRequired: "📮 <spring:message code='alert.zipcode.required'/>",
            mobileRequired: "📱 <spring:message code='alert.mobile.required'/>"
        };

        function pwCheck() {
            var pw = document.getElementById("pw").value;
            var confirm = document.getElementById("confirm").value;
            var label = document.getElementById("label");
            
            if (confirm === "") {
                label.innerHTML = "";
                return;
            }
            
            if (pw === confirm) {
                label.innerHTML = "🍌 비밀번호가 일치합니다!";
                label.className = "password-match match-success";
                document.getElementById("confirm").style.borderColor = "#27ae60";
            } else {
                label.innerHTML = "🚫 비밀번호가 일치하지 않습니다!";
                label.className = "password-match match-error";
                document.getElementById("confirm").style.borderColor = "#e74c3c";
            }
        }

        function allCheck() {
            var id = document.getElementById("id").value.trim();
            var pw = document.getElementById("pw").value.trim();
            var confirm = document.getElementById("confirm").value.trim();
            var userName = document.getElementById("userName").value.trim();
            var postcode = document.getElementById("sample6_postcode").value.trim();
            var address = document.getElementById("sample6_address").value.trim();
            var mobile = document.getElementById("mobile").value.trim();

            if (!id) {
                showBananaAlert(messages.idRequired, "id");
                return;
            }
            if (!pw) {
                showBananaAlert(messages.pwRequired, "pw");
                return;
            }
            if (pw !== confirm) {
                showBananaAlert(messages.pwMismatch, "confirm");
                return;
            }
            if (!userName) {
                showBananaAlert(messages.nameRequired, "userName");
                return;
            }
            if (!postcode || !address) {
                showBananaAlert(messages.zipcodeRequired);
                return;
            }
            if (!mobile) {
                showBananaAlert(messages.mobileRequired, "mobile");
                return;
            }
            
            // 성공 애니메이션
            document.querySelector('.signup-form').classList.add('success-animation');
            
            setTimeout(function() {
                document.getElementById("f").submit();
            }, 600);
        }
        
        function showBananaAlert(message, focusId) {
            alert(message);
            if (focusId) {
                document.getElementById(focusId).focus();
                document.getElementById(focusId).style.borderColor = "#e74c3c";
                setTimeout(function() {
                    document.getElementById(focusId).style.borderColor = "#f9d71c";
                }, 2000);
            }
        }
        
        // 입력 필드 애니메이션
        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('focus', function() {
                this.style.borderColor = '#e67e22';
                this.parentElement.style.transform = 'scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                if (this.value === '') {
                    this.style.borderColor = '#f9d71c';
                } else {
                    this.style.borderColor = '#27ae60';
                }
                this.parentElement.style.transform = 'scale(1)';
            });
        });
        
        // 랜덤 바나나 생성
        setInterval(function() {
            if (Math.random() < 0.2) {
                createFallingBanana();
            }
        }, 4000);
        
        function createFallingBanana() {
            var banana = document.createElement('div');
            banana.innerHTML = '🍌';
            banana.style.position = 'fixed';
            banana.style.fontSize = '25px';
            banana.style.opacity = '0.2';
            banana.style.left = Math.random() * window.innerWidth + 'px';
            banana.style.top = '-50px';
            banana.style.animation = 'fallDown 5s linear forwards';
            banana.style.zIndex = '0';
            document.body.appendChild(banana);
            
            setTimeout(function() {
                if (banana.parentNode) {
                    banana.remove();
                }
            }, 5000);
        }
        
        // CSS 애니메이션 추가
        var style = document.createElement('style');
        style.textContent = `
            @keyframes fallDown {
                to {
                    transform: translateY(calc(100vh + 100px)) rotate(720deg);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
