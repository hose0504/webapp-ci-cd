<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🍌 바나나 러브 캠페인</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #FFE135 0%, #FFA500 100%);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .floating-bananas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .banana {
            position: absolute;
            font-size: 2rem;
            animation: float 6s ease-in-out infinite;
            opacity: 0.3;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }

        .container {
            position: relative;
            z-index: 10;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .campaign-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            border: 3px solid rgba(255, 255, 255, 0.3);
            transform: translateY(0);
            transition: all 0.3s ease;
        }

        .campaign-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.3);
        }

        .header {
            margin-bottom: 30px;
        }

        .title {
            font-size: 3rem;
            color: #FF6B35;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .subtitle {
            font-size: 1.3rem;
            color: #333;
            margin-bottom: 20px;
        }

        .participants-counter {
            display: inline-flex;
            align-items: center;
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
            color: white;
            padding: 15px 25px;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from { box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3); }
            to { box-shadow: 0 8px 25px rgba(255, 107, 53, 0.6); }
        }

        .login-form {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
            font-size: 1.1rem;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 3px solid #FFE135;
            border-radius: 25px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .form-input:focus {
            outline: none;
            border-color: #FF6B35;
            box-shadow: 0 0 20px rgba(255, 107, 53, 0.3);
            transform: scale(1.02);
        }

        .submit-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(45deg, #FF6B35, #FFE135);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.3rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(255, 107, 53, 0.4);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .success-message {
            display: none;
            background: linear-gradient(45deg, #4CAF50, #8BC34A);
            color: white;
            padding: 20px;
            border-radius: 15px;
            margin-top: 20px;
            font-size: 1.2rem;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .campaign-info {
            margin-top: 30px;
            padding: 25px;
            background: rgba(255, 235, 59, 0.2);
            border-radius: 20px;
            border-left: 5px solid #FFE135;
        }

        .campaign-info h3 {
            color: #FF6B35;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }

        .campaign-info p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .progress-bar {
            width: 100%;
            height: 12px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            margin: 20px 0;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(45deg, #4CAF50, #8BC34A);
            border-radius: 10px;
            width: 0%;
            transition: width 0.5s ease;
        }

        @media (max-width: 600px) {
            .campaign-card {
                padding: 20px;
                margin: 10px;
            }
            
            .title {
                font-size: 2rem;
            }
            
            .subtitle {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
  <!-- 서버에서 컨텍스트 경로 가져와서 JS 변수에 할당 -->
  <script>
    const ctx = '${pageContext.request.contextPath}';
  </script>

  <!-- 배경 애니메이션용 바나나들 -->
  <div class="floating-bananas" id="floatingBananas"></div>

  <!-- 실제 폼(전송은 JS fetch로 처리) -->
  <form id="campaignForm">
    <input type="hidden" name="username" id="h_username" />
  </form>

  <div class="container">
    <div class="campaign-card">
      <!-- 헤더 -->
      <div class="header">
        <h1 class="title">🍌 바나나 러브 캠페인</h1>
        <p class="subtitle">건강한 바나나로 더 나은 세상을 만들어요!</p>
        <div class="participants-counter">
          👥 현재 참여자: <span id="participantCount">0</span>명
        </div>
      </div>

      <!-- 참여 폼 -->
      <div class="login-form" id="formContainer">
        <div class="form-group">
          <label class="form-label" for="username">🆔 아이디</label>
          <input type="text"
                 id="username"
                 class="form-input"
                 placeholder="아이디를 입력하세요"
                 required>
        </div>
        <button type="button" class="submit-btn" onclick="joinCampaign();">🍌 캠페인 참여하기 🍌</button>
      </div>

      <!-- 참여 완료 메시지 (처음엔 숨김) -->
      <div class="success-message" id="successMessage">
        🎉 참여가 완료되었습니다! 🎉
      </div>

      <!-- 캠페인 정보 -->
      <div class="campaign-info">
        <h3>🌟 캠페인 목표</h3>
        <p>📈 목표 참여자: 5,000명</p>
        <div class="progress-bar">
          <div class="progress-fill" id="progressFill"></div>
        </div>
        <p id="progressText">현재 0.0% 달성!</p>

        <h3 style="margin-top: 20px;">🎁 참여 혜택</h3>
        <p>• 바나나 건강 가이드북 무료 제공</p>
        <p>• 월간 바나나 레시피 뉴스레터</p>
        <p>• 바나나 농장 견학 이벤트 우선 참여</p>
        <p>• 친환경 바나나 할인 쿠폰</p>
      </div>
    </div>
  </div>

  <!-- 메인으로 돌아가기 버튼 -->
  <div style="margin-top: 30px; text-align: center;">
    <button onclick="location.href='${pageContext.request.contextPath}/template'"
            style="padding: 12px 24px; font-size: 1.1rem;
                   background: #FF6B35; color: white;
                   border: none; border-radius: 30px;
                   cursor: pointer; font-weight: bold;">
      ⬅️ 메인으로 돌아가기
    </button>
  </div>

  <script>
    // 서버에서 내려줄 totalCount를 EL로 삽입 (null 체크 포함)
    let totalCount = ${totalCount == null ? 0 : totalCount};

    // DOM 로드 시, 초기 진행률 업데이트 및 바나나 애니메이션 생성
    document.addEventListener('DOMContentLoaded', () => {
      updateProgress(totalCount);
      createFloatingBananas();
    });

    // 진행률 업데이트 함수
    function updateProgress(total) {
      const percentage = (total / 5000) * 100;
      document.getElementById('progressFill').style.width = percentage + '%';
      document.getElementById('progressText').textContent = `현재 ${percentage.toFixed(1)}% 달성!`;
      document.getElementById('participantCount').textContent = total.toLocaleString() + '명';
    }

    // 캠페인 참여 요청 (AJAX)
    async function joinCampaign() {
      const usernameInput = document.getElementById('username');
      const username = usernameInput.value.trim();
      if (!username) {
        alert('아이디를 입력해주세요.');
        return;
      }

      // 비활성화해서 중복 클릭 방지
      usernameInput.disabled = true;
      document.querySelector('.submit-btn').disabled = true;

      // 숨겨진 필드에 username 세팅
      document.getElementById('h_username').value = username;
      const formElement = document.getElementById('campaignForm');
      const formData = new FormData(formElement);

      try {
        // ctx에는 예: '/project1' (서버의 컨텍스트 경로)가 들어 있음
        const baseUrl = window.location.origin + ctx;
        const resp = await fetch("/campaign/join", {
        	  method: "POST",
        	  body: formData
        	});
        if (!resp.ok) throw new Error(`응답 실패: ${resp.status}`);

        // 서버가 성공적으로 저장했다고 가정
        totalCount++;
        updateProgress(totalCount);

        // 폼 숨기고 완료 메시지 표시
        document.getElementById('formContainer').style.display = 'none';
        const msgDiv = document.getElementById('successMessage');
        msgDiv.style.display = 'block';

      } catch (err) {
        alert('참여 처리 중 오류가 발생했습니다.\n' + err.message);
        // 실패 시 다시 활성화
        usernameInput.disabled = false;
        document.querySelector('.submit-btn').disabled = false;
      }
    }

    // 배경 바나나 애니메이션 생성
    function createFloatingBananas() {
      const container = document.getElementById('floatingBananas');
      for (let i = 0; i < 15; i++) {
        const banana = document.createElement('div');
        banana.className = 'banana';
        banana.innerHTML = '🍌';
        banana.style.left = Math.random() * 100 + '%';
        banana.style.top  = Math.random() * 100 + '%';
        banana.style.animationDelay    = Math.random() * 6 + 's';
        banana.style.animationDuration = (4 + Math.random() * 4) + 's';
        container.appendChild(banana);
      }
    }
  </script>
</body>
</html>