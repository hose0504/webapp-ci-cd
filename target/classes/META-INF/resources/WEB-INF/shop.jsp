<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프리미엄 바나나 구매하기</title>

  <!-- ===================================== -->
  <!--              인라인 CSS              -->
  <!-- ===================================== -->
  <style>
    /* Reset & Box-sizing */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Body 스타일 */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #fff9c4, #f7dc6f);
      min-height: 100vh;
      padding: 20px;
    }

    /* 뒤로가기 버튼 */
    .back-button {
      position: fixed;
      top: 20px;
      left: 20px;
      width: 50px;
      height: 50px;
      background: white;
      border: 2px solid #f39c12;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      font-size: 1.5rem;
      color: #f39c12;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      z-index: 100;
    }
    .back-button:hover {
      background: #f39c12;
      color: white;
      transform: scale(1.1);
      box-shadow: 0 8px 20px rgba(243,156,18,0.3);
    }

    /* 컨테이너 */
    .container {
      max-width: 800px;
      margin: 0 auto;
      background: white;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0,0,0,0.1);
      overflow: hidden;
    }

    /* 상품 섹션 */
    .product-section {
      display: flex;
      padding: 40px;
      gap: 40px;
    }
    .product-image {
      flex: 1;
      text-align: center;
    }
    .banana-emoji {
      font-size: 120px;
      animation: bounce 2s infinite;
    }
    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
      40% { transform: translateY(-10px); }
      60% { transform: translateY(-5px); }
    }

    .product-info {
      flex: 1;
      padding: 20px 0;
    }
    .product-title {
      font-size: 2.5rem;
      color: #2c3e50;
      margin-bottom: 10px;
      font-weight: bold;
    }
    .product-price {
      font-size: 2rem;
      color: #e74c3c;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .product-description {
      color: #7f8c8d;
      line-height: 1.6;
      margin-bottom: 30px;
      font-size: 1.1rem;
    }

    /* 수량 선택 영역 */
    .quantity-selector {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-bottom: 30px;
    }
    .quantity-label {
      font-weight: bold;
      color: #2c3e50;
    }
    .quantity-controls {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .quantity-btn {
      width: 40px;
      height: 40px;
      border: 2px solid #f39c12;
      background: white;
      border-radius: 50%;
      font-size: 1.2rem;
      font-weight: bold;
      color: #f39c12;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .quantity-btn:hover {
      background: #f39c12;
      color: white;
      transform: scale(1.1);
    }
    .quantity-input {
      width: 60px;
      height: 40px;
      text-align: center;
      border: 2px solid #ddd;
      border-radius: 8px;
      font-size: 1.1rem;
      font-weight: bold;
    }

    /* 구매하기 버튼 */
    .purchase-btn {
      width: 100%;
      padding: 15px;
      background: linear-gradient(45deg, #f39c12, #e67e22);
      color: white;
      border: none;
      border-radius: 10px;
      font-size: 1.3rem;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(243,156,18,0.3);
    }
    .purchase-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(243,156,18,0.4);
    }

    /* 총 가격 표시 */
    .total-price {
      font-size: 1.2rem;
      color: #e74c3c;
      font-weight: bold;
      margin-top: 10px;
    }

    /* 구매 모달 */
    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.5);
      z-index: 1000;
      animation: fadeIn 0.3s ease;
    }
    .modal-content {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background: white;
      padding: 40px;
      border-radius: 20px;
      max-width: 500px;
      width: 90%;
      text-align: center;
      animation: slideIn 0.3s ease;
    }
    @keyframes fadeIn {
      from { opacity: 0; } to { opacity: 1; }
    }
    @keyframes slideIn {
      from { transform: translate(-50%, -60%); opacity: 0; }
      to { transform: translate(-50%, -50%); opacity: 1; }
    }
    .modal h2 {
      color: #2c3e50;
      margin-bottom: 20px;
      font-size: 1.8rem;
    }
    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }
    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #2c3e50;
    }
    .form-group input {
      width: 100%;
      padding: 12px;
      border: 2px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      transition: border-color 0.3s ease;
    }
    .form-group input:focus {
      outline: none;
      border-color: #f39c12;
    }
    .modal-buttons {
      display: flex;
      gap: 15px;
      justify-content: center;
      margin-top: 30px;
    }
    .modal-btn {
      padding: 12px 25px;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .confirm-btn {
      background: #27ae60;
      color: white;
    }
    .confirm-btn:hover {
      background: #219a52;
      transform: translateY(-2px);
    }
    .cancel-btn {
      background: #95a5a6;
      color: white;
    }
    .cancel-btn:hover {
      background: #7f8c8d;
      transform: translateY(-2px);
    }

    /* 성공 알림 메시지 */
    .success-message {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background: linear-gradient(45deg, #27ae60, #2ecc71);
      color: white;
      padding: 30px 50px;
      border-radius: 15px;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      box-shadow: 0 10px 30px rgba(39,174,96,0.3);
      z-index: 1001;
      animation: successPop 0.5s ease;
    }
    @keyframes successPop {
      0% { transform: translate(-50%, -50%) scale(0.5); opacity: 0; }
      50% { transform: translate(-50%, -50%) scale(1.1); }
      100% { transform: translate(-50%, -50%) scale(1); opacity: 1; }
    }

    /* 반응형 */
    @media (max-width: 768px) {
      .product-section {
        flex-direction: column;
        padding: 20px;
        gap: 20px;
      }
      .product-title {
        font-size: 2rem;
      }
      .banana-emoji {
        font-size: 80px;
      }
    }
  </style>
  <!-- ===================================== -->
  <!--            인라인 CSS 끝              -->
  <!-- ===================================== -->
</head>

<body>
  <!-- 뒤로가기 버튼 -->
  <button type="button" class="back-button" onclick="goBack()" title="돌아가기">←</button>

  <!-- ===================================== -->
  <!--          주문 폼 (숨겨진 필드)        -->
  <!-- ===================================== -->
  <form id="orderForm">
    <!-- 숨겨진(hidden) 필드 — JavaScript에서 값을 채워줄 예정 -->
    <input type="hidden" name="orderId" id="h_orderId" />
    <input type="hidden" name="quantity" id="h_quantity" />
    <input type="hidden" name="unitPrice" id="h_unitPrice" />
    <input type="hidden" name="totalPrice" id="h_totalPrice" />
    <input type="hidden" name="customerName" id="h_customerName" />
    <input type="hidden" name="customerPhone" id="h_customerPhone" />
    <input type="hidden" name="customerAddress" id="h_customerAddress" />

    <div class="container">
      <div class="product-section">
        <!-- 1) 상품 이미지 -->
        <div class="product-image">
          <div class="banana-emoji">🍌</div>
        </div>

        <!-- 2) 상품 정보 -->
        <div class="product-info">
          <h1 class="product-title">프리미엄 바나나</h1>
          <div class="product-price">3,000원</div>
          <p class="product-description">
            달콤하고 영양가 높은 프리미엄 바나나입니다.
            신선하고 맛있는 바나나로 건강한 하루를 시작하세요!
            비타민과 미네랄이 풍부하여 간식이나 아침식사로 완벽합니다.
          </p>

          <!-- 수량 선택 -->
          <div class="quantity-selector">
            <span class="quantity-label">수량:</span>
            <div class="quantity-controls">
              <button type="button" id="btnDec" class="quantity-btn">-</button>
              <input type="number" id="quantity" class="quantity-input" value="1" min="1">
              <button type="button" id="btnInc" class="quantity-btn">+</button>
            </div>
          </div>

          <!-- 총 가격 -->
          <div class="total-price" id="totalPrice">총 가격: 3,000원</div>

          <!-- 구매하기 버튼 -->
          <button type="button" class="purchase-btn" onclick="openPurchaseModal(); return false;">
            🛒 구매하기
          </button>
        </div>
      </div>
    </div>
  </form>
  <!-- ===================================== -->
  <!--           주문 폼 끝                  -->
  <!-- ===================================== -->

  <!-- ===================================== -->
  <!--              구매 모달               -->
  <!-- ===================================== -->
  <div id="purchaseModal" class="modal">
    <div class="modal-content">
      <h2>🍌 바나나 구매</h2>
      <div class="form-group">
        <label for="customerName">이름</label>
        <input type="text" id="customerName" placeholder="성함을 입력해주세요" />
      </div>
      <div class="form-group">
        <label for="customerPhone">전화번호</label>
        <input type="tel" id="customerPhone" placeholder="010-0000-0000" />
      </div>
      <div class="form-group">
        <label for="customerAddress">배송 주소</label>
        <input type="text" id="customerAddress" placeholder="배송받을 주소를 입력해주세요" />
      </div>
      <div class="total-price" id="modalTotalPrice">총 가격: 3,000원</div>
      <div class="modal-buttons">
        <button
          type="button"
          class="modal-btn confirm-btn"
          onclick="confirmPurchase(); return false;"
        >
          구매 확정
        </button>
        <button
          type="button"
          class="modal-btn cancel-btn"
          onclick="closePurchaseModal(); return false;"
        >
          취소
        </button>
      </div>
    </div>
  </div>
  <!-- ===================================== -->
  <!--             구매 모달 끝              -->
  <!-- ===================================== -->

  <!-- ===================================== -->
  <!--          성공 알림 메시지             -->
  <!-- ===================================== -->
  <div id="successMessage" class="success-message">
    <div>🎉</div>
    <div>구매가 완료되었습니다!</div>
    <div id="orderNumber" style="font-size:1.1rem; margin:15px 0; color:#fff3cd; font-weight:bold;"></div>
    <div style="font-size:1rem; margin-top:10px;">맛있는 바나나를 곧 받아보실 수 있습니다.</div>
  </div>
  <!-- ===================================== -->
  <!--         성공 알림 메시지 끝            -->
  <!-- ===================================== -->

  <!-- ===================================== -->
  <!--           JavaScript 로직             -->
  <!-- ===================================== -->
  <script>
    // 전역 변수
    let qtyInput, totalEl, modalTotalEl;
    const basePrice = 3000;

    // 뒤로가기 함수
    function goBack() {
      if (window.history.length > 1) {
        window.history.back();
      } else {
        alert('이전 페이지가 없습니다.');
      }
    }

    // 수량별 가격 갱신
    function refreshPrice() {
      let qty = parseInt(qtyInput.value, 10);
      if (isNaN(qty) || qty < 1) qty = 1;
      qtyInput.value = qty;

      const total = qty * basePrice;
      const fmt = total.toLocaleString('ko-KR');
      totalEl.textContent = '총 가격: ' + fmt + '원';
      modalTotalEl.textContent = '총 가격: ' + fmt + '원';
    }

    // 모달 열기
    function openPurchaseModal() {
      document.getElementById('purchaseModal').style.display = 'block';
      refreshPrice();
    }
    // 모달 닫기
    function closePurchaseModal() {
      document.getElementById('purchaseModal').style.display = 'none';
      document.getElementById('customerName').value = '';
      document.getElementById('customerPhone').value = '';
      document.getElementById('customerAddress').value = '';
    }

    // 주문번호 생성 (예: BN202506059845)
    function generateOrderNumber() {
      const now = new Date();
      const year  = now.getFullYear().toString();
      const month = String(now.getMonth() + 1).padStart(2, '0');
      const day   = String(now.getDate()).padStart(2, '0');
      const rand  = Math.floor(1000 + Math.random() * 9000);
      return 'BN' + year + month + day + rand;
    }

    // AJAX로 주문 전송
    async function confirmPurchase() {
      const name    = document.getElementById('customerName').value.trim();
      const phone   = document.getElementById('customerPhone').value.trim();
      const address = document.getElementById('customerAddress').value.trim();

      if (!name || !phone || !address) {
        alert('모든 필드를 입력해주세요!');
        return;
      }

      const orderNum = generateOrderNumber();

      // 숨겨진 필드에 값 채우기
      document.getElementById('h_orderId').value         = orderNum;
      document.getElementById('h_quantity').value        = qtyInput.value;
      document.getElementById('h_unitPrice').value       = basePrice;
      document.getElementById('h_totalPrice').value      = qtyInput.value * basePrice;
      document.getElementById('h_customerName').value    = name;
      document.getElementById('h_customerPhone').value  = phone;
      document.getElementById('h_customerAddress').value = address;

      // FormData 생성
      const form = document.getElementById('orderForm');
      const formData = new FormData(form);

      try {
        // ─── 반드시 "/shop/submit" 경로에 맞춰서 c:url을 닫아준다 ───
        const submitUrl = '<c:url value="/shop " />';

        const response = await fetch(submitUrl, {
          method: 'POST',
          body: formData
        });

        if (response.ok) {
          // 서버에서 받은 JSON 응답을 파싱 (예: { "orderId": "BN202506059845" })
          const data = await response.json();

          // 모달 닫고 성공 메시지 표시
          closePurchaseModal();
          document.getElementById('orderNumber').textContent = '주문번호: ' + data.orderId;
          const msg = document.getElementById('successMessage');
          msg.style.display = 'block';
          setTimeout(() => { msg.style.display = 'none'; }, 3000);
        } else {
          // 서버 에러인 경우, JSON 응답에 담긴 메시지를 보여준다
          const errorData = await response.json();
          throw new Error('서버 응답 오류: ' + (errorData.message || response.status));
        }
      } catch (err) {
        alert('구매 처리 중 오류가 발생했습니다.\n' + err.message);
      }
    } // confirmPurchase 함수 끝

    // 초기화: DOMContentLoaded에서 이벤트 바인딩
    document.addEventListener('DOMContentLoaded', () => {
      qtyInput     = document.getElementById('quantity');
      totalEl      = document.getElementById('totalPrice');
      modalTotalEl = document.getElementById('modalTotalPrice');

      // “+” 버튼 클릭
      document.getElementById('btnInc').addEventListener('click', () => {
        qtyInput.value = parseInt(qtyInput.value, 10) + 1;
        refreshPrice();
      });

      // “–” 버튼 클릭
      document.getElementById('btnDec').addEventListener('click', () => {
        const q = parseInt(qtyInput.value, 10);
        if (q > 1) {
          qtyInput.value = q - 1;
        }
        refreshPrice();
      });

      // 숫자를 직접 입력했을 때
      qtyInput.addEventListener('input', refreshPrice);

      // 초기 총 가격 계산
      refreshPrice();
    });
  </script>
  <!-- ===================================== -->
  <!--         JavaScript 로직 끝            -->
  <!-- ===================================== -->
</body>
</html>
