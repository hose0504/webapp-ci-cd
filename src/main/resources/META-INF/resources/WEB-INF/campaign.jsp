<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="floating-bananas" id="floatingBananas"></div>
    
    <div class="container">
        <div class="campaign-card">
            <div class="header">
                <h1 class="title">🍌 바나나 러브 캠페인</h1>
                <p class="subtitle">건강한 바나나로 더 나은 세상을 만들어요!</p>
                <div class="participants-counter">
                    👥 현재 참여자: <span id="participantCount">0</span>명
                </div>
            </div>

            <form class="login-form" id="campaignForm">
                <div class="form-group">
                    <label class="form-label" for="username">🆔 아이디</label>
                    <input type="text" id="username" class="form-input" placeholder="아이디를 입력하세요" required>
                </div>

                <button type="submit" class="submit-btn">
                    🍌 캠페인 참여하기 🍌
                </button>
            </form>

            <div class="success-message" id="successMessage">
                🎉 축하합니다! 바나나 러브 캠페인에 성공적으로 참여하셨습니다! 🎉
            </div>

            <div class="campaign-info">
                <h3>🌟 캠페인 목표</h3>
                <p>📈 목표 참여자: 5,000명</p>
                <div class="progress-bar">
                    <div class="progress-fill" id="progressFill"></div>
                </div>
                <p id="progressText">현재 24.9% 달성!</p>
                
                <h3 style="margin-top: 20px;">🎁 참여 혜택</h3>
                <p>• 바나나 건강 가이드북 무료 제공</p>
                <p>• 월간 바나나 레시피 뉴스레터</p>
                <p>• 바나나 농장 견학 이벤트 우선 참여</p>
                <p>• 친환경 바나나 할인 쿠폰</p>
            </div>
        </div>
    </div>

    <script>
        // 참여자 수 관리
        let participantCount = 0;
        const participantElement = document.getElementById('participantCount');
        const progressFill = document.getElementById('progressFill');
        const progressText = document.getElementById('progressText');

        // 배경 바나나 애니메이션 생성
        function createFloatingBananas() {
            const container = document.getElementById('floatingBananas');
            for (let i = 0; i < 15; i++) {
                const banana = document.createElement('div');
                banana.className = 'banana';
                banana.innerHTML = '🍌';
                banana.style.left = Math.random() * 100 + '%';
                banana.style.top = Math.random() * 100 + '%';
                banana.style.animationDelay = Math.random() * 6 + 's';
                banana.style.animationDuration = (4 + Math.random() * 4) + 's';
                container.appendChild(banana);
            }
        }

        // 진행률 업데이트 함수
        function updateProgress() {
            const percentage = (participantCount / 5000) * 100;
            progressFill.style.width = percentage + '%';
            progressText.textContent = `현재 ${percentage.toFixed(1)}% 달성!`;
        }

        // 참여자 수 실시간 증가 (3-8초마다)
        function startParticipantCounter() {
            // 자동 증가 기능 비활성화 - 수동으로만 증가
        }

        // 폼 제출 처리
        document.getElementById('campaignForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            
            if (username) {
                // 참여자 수 증가
                participantCount += 1;
                participantElement.textContent = participantCount.toLocaleString();
                updateProgress();
                
                // 성공 메시지 표시
                const successMessage = document.getElementById('successMessage');
                successMessage.style.display = 'block';
                successMessage.innerHTML = `🎉 ${username}님, 바나나 러브 캠페인에 성공적으로 참여하셨습니다! 🎉`;
                
                // 폼 숨기기
                this.style.display = 'none';
                
                // 축하 효과
                document.body.style.animation = 'none';
                setTimeout(() => {
                    document.body.style.animation = '';
                }, 100);
            }
        });

        // 입력 필드 애니메이션
        document.querySelectorAll('.form-input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.querySelector('.form-label').style.color = '#FF6B35';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.querySelector('.form-label').style.color = '#333';
            });
        });

        // 초기화
        createFloatingBananas();
        startParticipantCounter();
        updateProgress();

        // 페이지 로드 애니메이션
        window.addEventListener('load', function() {
            document.querySelector('.campaign-card').style.opacity = '0';
            document.querySelector('.campaign-card').style.transform = 'translateY(50px)';
            
            setTimeout(() => {
                document.querySelector('.campaign-card').style.transition = 'all 0.8s ease-out';
                document.querySelector('.campaign-card').style.opacity = '1';
                document.querySelector('.campaign-card').style.transform = 'translateY(0)';
            }, 100);
        });
    </script>
    <div style="margin-top: 30px; text-align: center;">
    <button onclick="location.href='/template'" 
            style="padding: 12px 24px; font-size: 1.1rem; background: #FF6B35; color: white; border: none; border-radius: 30px; cursor: pointer; font-weight: bold;">
        ⬅️ 메인으로 돌아가기
    </button>
</div>
    
</body>
</html>