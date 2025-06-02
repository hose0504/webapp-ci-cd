<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gros Michel 바나나 성공신화</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', 'Malgun Gothic', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #fffef7 0%, #fefcf0 50%, #fdf8e1 100%);
            min-height: 100vh;
            line-height: 1.7;
            color: #8b6914;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            text-align: center;
            padding: 60px 0;
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            margin-bottom: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(244, 224, 77, 0.3);
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        header::before {
            content: '🍌';
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 150px;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        h1 {
            font-size: 3.5em;
            font-weight: 700;
            color: #8b6914;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(139, 105, 20, 0.2);
        }

        .subtitle {
            font-size: 1.3em;
            color: #c49a1a;
            font-weight: 300;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 40px;
            margin-bottom: 50px;
        }

        .main-content {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
        }

        .info-card {
            background: rgba(255, 250, 240, 0.8);
            backdrop-filter: blur(8px);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
            color: #8b6914;
            position: sticky;
            top: 20px;
        }

        .info-card h3 {
            color: #8b6914;
            margin-bottom: 20px;
            font-size: 1.4em;
            font-weight: 600;
        }

        .info-item {
            margin-bottom: 15px;
            padding: 10px 0;
            border-bottom: 1px solid rgba(244, 224, 77, 0.3);
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-label {
            font-weight: 600;
            color: #c49a1a;
            display: block;
            margin-bottom: 5px;
        }

        h2 {
            color: #8b6914;
            margin: 30px 0 20px 0;
            font-size: 2em;
            font-weight: 600;
            position: relative;
            padding-left: 20px;
        }

        h2::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 30px;
            background: linear-gradient(45deg, #f4e04d, #f7e83b);
            border-radius: 2px;
        }

        p {
            margin-bottom: 18px;
            font-size: 1.1em;
            text-align: justify;
        }

        .highlight {
            background: rgba(244, 224, 77, 0.3);
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 500;
            color: #8b6914;
        }

        .news-section {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .news-card {
            background: rgba(255, 250, 240, 0.8);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            transition: all 0.4s ease;
            border-left: 4px solid #f4e04d;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(244, 224, 77, 0.2);
        }

        .news-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, #f4e04d, #f7e83b);
        }

        .news-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(244, 224, 77, 0.25);
        }

        .news-date {
            color: #c49a1a;
            font-size: 0.9em;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .news-title {
            font-size: 1.2em;
            font-weight: 600;
            color: #8b6914;
            margin-bottom: 12px;
            line-height: 1.4;
        }

        .news-content {
            color: #8b6914;
            font-size: 1em;
            line-height: 1.6;
            opacity: 0.8;
        }

        .timeline {
            position: relative;
            padding: 20px 0;
            margin: 30px 0;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 50px;
            top: 0;
            bottom: 0;
            width: 3px;
            background: linear-gradient(to bottom, #f4e04d, #f7e83b);
        }

        .timeline-item {
            position: relative;
            padding: 20px 0 20px 100px;
            margin-bottom: 30px;
        }

        .timeline-year {
            position: absolute;
            left: 0;
            top: 25px;
            width: 80px;
            height: 40px;
            background: linear-gradient(45deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.9em;
            box-shadow: 0 5px 15px rgba(244, 224, 77, 0.3);
        }

        .timeline-content {
            background: rgba(255, 250, 240, 0.8);
            backdrop-filter: blur(5px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            border: 1px solid rgba(244, 224, 77, 0.2);
        }

        @media (max-width: 768px) {
            .content-grid {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 2.5em;
            }
            
            .news-grid {
                grid-template-columns: 1fr;
            }
            
            .timeline::before {
                left: 30px;
            }
            
            .timeline-item {
                padding-left: 80px;
            }
            
            .timeline-year {
                width: 60px;
                height: 35px;
                font-size: 0.8em;
            }
        }

        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .floating-banana {
            position: absolute;
            font-size: 40px;
            opacity: 0.1;
            animation: floatAround 20s infinite linear;
        }

        @keyframes floatAround {
            0% { transform: translateX(-100px) rotate(0deg); }
            25% { transform: translateX(calc(100vw + 100px)) rotate(90deg); }
            50% { transform: translateX(calc(100vw + 100px)) translateY(calc(100vh + 100px)) rotate(180deg); }
            75% { transform: translateX(-100px) translateY(calc(100vh + 100px)) rotate(270deg); }
            100% { transform: translateX(-100px) rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="floating-elements">
        <div class="floating-banana" style="top: 10%; animation-delay: 0s;">🍌</div>
        <div class="floating-banana" style="top: 30%; animation-delay: 5s;">🍌</div>
        <div class="floating-banana" style="top: 50%; animation-delay: 10s;">🍌</div>
        <div class="floating-banana" style="top: 70%; animation-delay: 15s;">🍌</div>
    </div>

    <div class="container">
        <header>
            <h1>Gros Michel</h1>
            
        </header>

        <div class="content-grid">
            <div class="main-content">
                <h2>🍌 전설의 시작</h2>
                <p><span class="highlight">Gros Michel</span>(그로 미셸), 일명 "Big Mike"는 1950년대까지 전 세계 바나나 시장을 지배했던 전설적인 품종입니다. 프랑스어로 "큰 미셸"이라는 뜻의 이 바나나는 단순한 과일이 아닌, 20세기 초 글로벌 무역의 상징이었습니다.</p>

                <p>1830년대 마르티니크 섬에서 프랑스 농장주 Jean Pouyat에 의해 발견된 이후, <span class="highlight">Gros Michel</span>은 카리브해 전역으로 퍼져나가며 "마르티니크 바나나"라는 애칭을 얻었습니다. 1890년대에 이르러서는 중앙아메리카 카리브해 연안 전체에서 재배되었고, 20세기 전환점에는 미국으로의 주요 수출품이 되었습니다.</p>

                <h2>🚢 완벽한 수출 품종</h2>
                <p>Gros Michel이 세계를 정복할 수 있었던 비밀은 바로 <span class="highlight">완벽한 물리적 특성</span>에 있었습니다. 두꺼운 껍질은 장거리 운송 중에도 과일을 보호했고, 단맛과 크리미한 질감은 소비자들을 매료시켰습니다. 오늘날 사탕에 사용되는 인공 바나나 향료조차 이 품종의 맛을 모델로 만들어졌을 정도입니다.</p>

                <div class="timeline">
                    <div class="timeline-item">
                        <div class="timeline-year">1830s</div>
                        <div class="timeline-content">
                            <strong>발견의 시대</strong><br>
                            마르티니크 섬에서 Jean Pouyat에 의해 발견, 현지에서 "마르티니크 바나나"로 알려짐
                        </div>
                    </div>
                    <div class="timeline-item">
                        <div class="timeline-year">1890s</div>
                        <div class="timeline-content">
                            <strong>확산의 시대</strong><br>
                            중앙아메리카 카리브해 연안 전체로 재배 확산, 미국 시장 진출 본격화
                        </div>
                    </div>
                    <div class="timeline-item">
                        <div class="timeline-year">1900-1950</div>
                        <div class="timeline-content">
                            <strong>황금기</strong><br>
                            전 세계 바나나 시장 독점, "바나나 공화국" 시대의 주역
                        </div>
                    </div>
                    <div class="timeline-item">
                        <div class="timeline-year">1950s</div>
                        <div class="timeline-content">
                            <strong>몰락의 시작</strong><br>
                            파나마병(푸사리움 시들음병) 대유행으로 대부분의 농장 파괴
                        </div>
                    </div>
                </div>

                <h2>⚡ 갑작스러운 종말</h2>
                <p>하지만 이 완벽해 보였던 성공신화는 1950년대 <span class="highlight">파나마병</span>이라 불리는 치명적인 진균병으로 인해 갑작스럽게 끝이 났습니다. 토양에 서식하는 Fusarium oxysporum 진균이 일으키는 이 병은 중남미 전역의 Gros Michel 농장을 초토화시켰습니다.</p>

                <p>이 재앙적인 상황에서 바나나 업계는 저항성을 가진 <span class="highlight">캐번디시 품종</span>으로 전환할 수밖에 없었습니다. 오늘날 우리가 먹는 바나나의 99%가 캐번디시 품종이며, 많은 사람들이 현재의 바나나가 예전보다 맛이 덜하다고 느끼는 이유이기도 합니다.</p>
            </div>

            <div class="info-card">
                <h3>📊 Gros Michel 팩트</h3>
                <div class="info-item">
                    <span class="info-label">별명</span>
                    Big Mike, 마르티니크 바나나
                </div>
                <div class="info-item">
                    <span class="info-label">발견 시기</span>
                    1830년대
                </div>
                <div class="info-item">
                    <span class="info-label">전성기</span>
                    1870-1950년대
                </div>
                <div class="info-item">
                    <span class="info-label">특징</span>
                    달콤하고 크리미한 맛, 두꺼운 껍질
                </div>
                <div class="info-item">
                    <span class="info-label">몰락 원인</span>
                    파나마병 (푸사리움 시들음병)
                </div>
                <div class="info-item">
                    <span class="info-label">후계자</span>
                    캐번디시 바나나
                </div>
                <div class="info-item">
                    <span class="info-label">현재 상태</span>
                    상업적 멸종, 일부 지역에서 소규모 재배
                </div>
            </div>
        </div>

        <div class="news-section">
            <h2>📰 관련 최신 뉴스 & 연구</h2>
            <div class="news-grid">
                <div class="news-card">
                    <div class="news-date">2025년 4월</div>
                    <div class="news-title">파나마병 연구 최신 동향</div>
                    <div class="news-content">
                        현재 캐번디시 바나나를 위협하는 TR4 균주에 대한 연구가 활발히 진행되고 있습니다. 2019년 콜롬비아에서 처음 발견된 이후 아메리카 대륙 전체가 경계 상태에 있습니다.
                    </div>
                </div>

                <div class="news-card">
                    <div class="news-date">2024년 10월</div>
                    <div class="news-title">Gros Michel 복원 프로젝트</div>
                    <div class="news-content">
                        Miami Fruit를 비롯한 여러 농장에서 Gros Michel 바나나의 소규모 재배를 시도하고 있습니다. 제한적이지만 온라인으로 구매가 가능한 상태입니다.
                    </div>
                </div>

                <div class="news-card">
                    <div class="news-date">2023년 10월</div>
                    <div class="news-title">바나나 팬데믹의 교훈</div>
                    <div class="news-content">
                        Hektoen International에서 발표한 연구에 따르면, Gros Michel의 멸종은 현대 농업의 단일재배 위험성을 보여주는 대표적 사례로 평가받고 있습니다.
                    </div>
                </div>

                <div class="news-card">
                    <div class="news-date">2023년 2월</div>
                    <div class="news-title">잃어버린 맛을 찾아서</div>
                    <div class="news-content">
                        Mobituaries �팟캐스트에서 다룬 Gros Michel의 역사가 큰 화제를 모았습니다. "Big Mike"라 불렸던 이 바나나의 풍부한 맛이 현재의 캐번디시보다 훨씬 우수했다는 증언들이 소개되었습니다.
                    </div>
                </div>

                <div class="news-card">
                    <div class="news-date">2022년 6월</div>
                    <div class="news-title">인공 바나나 향의 비밀</div>
                    <div class="news-content">
                        오늘날 사탕과 디저트에 사용되는 바나나 향료가 실제로는 Gros Michel의 맛을 재현한 것이라는 사실이 다시 주목받고 있습니다. 이는 현재 바나나와 인공 향료 사이의 맛 차이를 설명해줍니다.
                    </div>
                </div>

                <div class="news-card">
                    <div class="news-date">2021년 2월</div>
                    <div class="news-title">Atlas Obscura 특집</div>
                    <div class="news-content">
                        "A Quest for the Gros Michel"이라는 제목의 특집 기사에서 바나나 스플릿을 최초로 만든 연금술사부터 인공 바나나 향을 개발한 화학자까지, Gros Michel이 미국 문화에 미친 영향을 조명했습니다.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 페이지 로드 시 애니메이션 효과
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.news-card');
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '0';
                        entry.target.style.transform = 'translateY(30px)';
                        entry.target.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
                        
                        setTimeout(() => {
                            entry.target.style.opacity = '1';
                            entry.target.style.transform = 'translateY(0)';
                        }, Math.random() * 300);
                    }
                });
            }, observerOptions);

            cards.forEach(card => {
                observer.observe(card);
            });

            // 타임라인 아이템 애니메이션
            const timelineItems = document.querySelectorAll('.timeline-item');
            timelineItems.forEach((item, index) => {
                item.style.opacity = '0';
                item.style.transform = 'translateX(-50px)';
                item.style.transition = `all 0.8s cubic-bezier(0.4, 0, 0.2, 1) ${index * 0.2}s`;
                
                setTimeout(() => {
                    item.style.opacity = '1';
                    item.style.transform = 'translateX(0)';
                }, 500 + (index * 200));
            });
        });

        // 호버 효과 강화
        document.querySelectorAll('.news-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.borderLeftWidth = '6px';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.borderLeftWidth = '4px';
            });
        });
    </script>
    <div style="text-align: center; margin: 80px 0 40px 0;">
    <a href="/template" style="
        display: inline-block;
        padding: 12px 28px;
        background: linear-gradient(45deg, #f4e04d, #f7e83b);
        color: #8b6914;
        font-weight: bold;
        text-decoration: none;
        font-size: 1.1em;
        border-radius: 30px;
        box-shadow: 0 6px 12px rgba(244, 224, 77, 0.3);
        transition: all 0.3s ease;
    " 
    onmouseover="this.style.boxShadow='0 8px 16px rgba(244, 224, 77, 0.5)'"
    onmouseout="this.style.boxShadow='0 6px 12px rgba(244, 224, 77, 0.3)'">
        🏠 돌아가기
    </a>
</div>
</body>
</html>