<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프리미엄 바나나 구매하기</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #fff9c4, #f7dc6f); min-height: 100vh; padding: 20px; }
    .back-button { position: fixed; top: 20px; left: 20px; width: 50px; height: 50px; background: white; border: 2px solid #f39c12; border-radius: 50%; display: flex; align-items: center; justify-content: center; cursor: pointer; font-size: 1.5rem; color: #f39c12; box-shadow: 0 5px 15px rgba(0,0,0,0.1); transition: all 0.3s ease; z-index: 100; }
    .back-button:hover { background: #f39c12; color: white; transform: scale(1.1); box-shadow: 0 8px 20px rgba(243,156,18,0.3); }
    .container { max-width: 800px; margin: 0 auto; background: white; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); overflow: hidden; }
    .product-section { display: flex; padding: 40px; gap: 40px; }
    .product-image { flex: 1; text-align: center; }
    .banana-emoji { font-size: 120px; animation: bounce 2s infinite; }
    @keyframes bounce { 0%,20%,50%,80%,100% { transform: translateY(0);} 40% { transform: translateY(-10px);} 60% { transform: translateY(-5px);} }
    .product-info { flex: 1; padding: 20px 0; }
    .product-title { font-size: 2.5rem; color: #2c3e50; margin-bottom: 10px; font-weight: bold; }
    .product-price { font-size: 2rem; color: #e74c3c; font-weight: bold; margin-bottom: 20px; }
    .product-description { color: #7f8c8d; line-height: 1.6; margin-bottom: 30px; font-size: 1.1rem; }
    .quantity-selector { display: flex; align-items: center; gap: 15px; margin-bottom: 30px; }
    .quantity-label { font-weight: bold; color: #2c3e50; }
    .quantity-controls { display: flex; align-items: center; gap: 10px; }
    .quantity-btn { width: 40px; height: 40px; border: 2px solid #f39c12; background: white; border-radius: 50%; font-size: 1.2rem; font-weight: bold; color: #f39c12; cursor: pointer; transition: all 0.3s ease; }
    .quantity-btn:hover { background: #f39c12; color: white; transform: scale(1.1); }
    .quantity-input { width: 60px; height: 40px; text-align: center; border: 2px solid #ddd; border-radius: 8px; font-size: 1.1rem; font-weight: bold; }
    .purchase-btn { width: 100%; padding: 15px; background: linear-gradient(45deg,#f39c12,#e67e22); color: white; border: none; border-radius: 10px; font-size: 1.3rem; font-weight: bold; cursor: pointer; transition: all 0.3s ease; box-shadow: 0 5px 15px rgba(243,156,18,0.3); }
    .purchase-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(243,156,18,0.4); }
    .modal { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 1000; animation: fadeIn 0.3s ease; }
    .modal-content { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 40px; border-radius: 20px; max-width: 500px; width: 90%; text-align: center; animation: slideIn 0.3s ease; }
    @keyframes fadeIn { from { opacity: 0 } to { opacity: 1 } }
    @keyframes slideIn { from { transform: translate(-50%, -60%); opacity: 0 } to { transform: translate(-50%, -50%); opacity: 1 } }
    .modal h2 { color: #2c3e50; margin-bottom: 20px; font-size: 1.8rem; }
    .form-group { margin-bottom: 20px; text-align: left; }
    .form-group label { display: block; margin-bottom: 8px; font-weight: bold; color: #2c3e50; }
    .form-group input { width: 100%; padding: 12px; border: 2px solid #ddd; border-radius: 8px; font-size: 1rem; transition: border-color 0.3s ease; }
    .form-group input:focus { outline: none; border-color: #f39c12; }
    .modal-buttons { display: flex; gap: 15px; justify-content: center; margin-top: 30px; }
    .modal-btn { padding: 12px 25px; border: none; border-radius: 8px; font-size: 1rem; font-weight: bold; cursor: pointer; transition: all 0.3s ease; }
    .confirm-btn { background: #27ae60; color: white; }
    .confirm-btn:hover { background: #219a52; transform: translateY(-2px); }
    .cancel-btn { background: #95a5a6; color: white; }
    .cancel-btn:hover { background: #7f8c8d; transform: translateY(-2px); }
    .success-message { display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: linear-gradient(45deg,#27ae60,#2ecc71); color: white; padding: 30px 50px; border-radius: 15px; text-align: center; font-size: 1.5rem; font-weight: bold; box-shadow: 0 10px 30px rgba(39,174,96,0.3); z-index: 1001; animation: successPop 0.5s ease; }
    @keyframes successPop { 0% { transform: translate(-50%, -50%) scale(0.5); opacity: 0 } 50% { transform: translate(-50%, -50%) scale(1.1) } 100% { transform: translate(-50%, -50%) scale(1); opacity: 1 } }
    .total-price { font-size: 1.2rem; color: #e74c3c; font-weight: bold; margin-top: 10px; }
    @media(max-width:768px){ .product-section { flex-direction: column; padding: 20px; gap: 20px } .product-title { font-size: 2rem } .banana-emoji { font-size: 80px } }
  </style>
</head>
<body>
  <button class="back-button" onclick="goBack()" title="돌아가기">←</button>

  <div class="container">
    <div class="product-section">
      <div class="product-image">
        <div class="banana-emoji">🍌</div>
      </div>
      <div class="product-info">
        <h1 class="product-title">프리미엄 바나나</h1>
        <div class="product-price">3,000원</div>
        <p class="product-description">
          달콤하고 영양가 높은 프리미엄 바나나입니다.
          신선하고 맛있는 바나나로 건강한 하루를 시작하세요!
          비타민과 미네랄이 풍부하여 간식이나 아침식사로 완벽합니다.
        </p>
        <div class="quantity-selector">
          <span class="quantity-label">수량:</span>
          <div class="quantity-controls">
            <button id="btnDec" class="quantity-btn">-</button>
            <input type="number" id="quantity" class="quantity-input" value="1" min="1">
            <button id="btnInc" class="quantity-btn">+</button>
          </div>
        </div>
        <div class="total-price" id="totalPrice">총 가격: 3,000원</div>
        <button class="purchase-btn" onclick="openPurchaseModal()">🛒 구매하기</button>
      </div>
    </div>
  </div>

  <div id="purchaseModal" class="modal">
    <div class="modal-content">
      <h2>🍌 바나나 구매</h2>
      <div class="form-group">
        <label for="customerName">이름</label>
        <input type="text" id="customerName" placeholder="성함을 입력해주세요">
      </div>
      <div class="form-group">
        <label for="customerPhone">전화번호</label>
        <input type="tel" id="customerPhone" placeholder="010-0000-0000">
      </div>
      <div class="form-group">
        <label for="customerAddress">배송 주소</label>
        <input type="text" id="customerAddress" placeholder="배송받을 주소를 입력해주세요">
      </div>
      <div class="total-price" id="modalTotalPrice">총 가격: 3,000원</div>
      <div class="modal-buttons">
        <button class="modal-btn confirm-btn" onclick="completePurchase()">구매 확정</button>
        <button class="modal-btn cancel-btn" onclick="closePurchaseModal()">취소</button>
      </div>
    </div>
  </div>

  <div id="successMessage" class="success-message">
    <div>🎉</div>
    <div>구매가 완료되었습니다!</div>
    <div id="orderNumber" style="font-size:1.1rem; margin:15px 0; color:#fff3cd; font-weight:bold;"></div>
    <div style="font-size:1rem; margin-top:10px;">맛있는 바나나를 곧 받아보실 수 있습니다.</div>
  </div>

  <script>
    // 전역 변수
    let qtyInput, totalEl, modalTotalEl;
    const basePrice = 3000;

    // 전역 함수
    function goBack() {
      if (window.history.length > 1) window.history.back();
      else alert('이전 페이지가 없습니다.');
    }
    function openPurchaseModal() {
      document.getElementById('purchaseModal').style.display = 'block';
      refreshPrice();
    }
    function closePurchaseModal() {
      document.getElementById('purchaseModal').style.display = 'none';
      document.getElementById('customerName').value = '';
      document.getElementById('customerPhone').value = '';
      document.getElementById('customerAddress').value = '';
    }
    function generateOrderNumber() {
      const now = new Date();
      const dateStr =
        now.getFullYear().toString() +
        String(now.getMonth() + 1).padStart(2, '0') +
        String(now.getDate()).padStart(2, '0');
      const rand = Math.floor(1000 + Math.random() * 9000);
      return 'BN' + dateStr + rand;
    }
    function completePurchase() {
      const name = document.getElementById('customerName').value.trim();
      const phone = document.getElementById('customerPhone').value.trim();
      const address = document.getElementById('customerAddress').value.trim();
      if (!name || !phone || !address) {
        alert('모든 필드를 입력해주세요!');
        return;
      }
      const orderNum = generateOrderNumber();
      closePurchaseModal();
      document.getElementById('orderNumber').textContent = '주문번호: ' + orderNum;
      const msg = document.getElementById('successMessage');
      msg.style.display = 'block';
      setTimeout(() => (msg.style.display = 'none'), 3000);
    }

    // 수량 & 가격 갱신 함수
    function refreshPrice() {
      let qty = parseInt(qtyInput.value, 10);
      if (isNaN(qty) || qty < 1) qty = 1;
      qtyInput.value = qty;
      const total = qty * basePrice;
      const fmt = total.toLocaleString('ko-KR');
      totalEl.textContent = '총 가격: ' + fmt + '원';
      modalTotalEl.textContent = '총 가격: ' + fmt + '원';
    }

    // 이벤트 바인딩
    document.addEventListener('DOMContentLoaded', () => {
      qtyInput = document.getElementById('quantity');
      totalEl = document.getElementById('totalPrice');
      modalTotalEl = document.getElementById('modalTotalPrice');

      document.getElementById('btnInc').addEventListener('click', () => {
        qtyInput.value = parseInt(qtyInput.value, 10) + 1; refreshPrice();
      });
      document.getElementById('btnDec').addEventListener('click', () => {
        const q = parseInt(qtyInput.value, 10);
        if (q > 1) qtyInput.value = q - 1;
        refreshPrice();
      });
      qtyInput.addEventListener('input',refreshPrice);

      refreshPrice();
    });
  </script>
</body>
</html>
