// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

document.addEventListener('DOMContentLoaded', function() {
  // 販売価格の入力フィールドを取得
  var priceInput = document.getElementById('item-price');
  var feeElement = document.getElementById('add-tax-price');
  var profitElement = document.getElementById('profit');

  // 販売価格の入力フィールドの値が変更されたときに計算を実行するイベントリスナーを追加
  priceInput.addEventListener('input', function() {
    // 販売価格を取得
    var price = parseFloat(priceInput.value);

    // 手数料と販売利益を計算
    var fee = price * 0.1; // 10%の手数料として仮定
    var profit = price - fee;

    // 結果を表示
    feeElement.textContent = isNaN(fee) ? '' : fee.toFixed(0); // 手数料を整数で表示（未入力時は空文字列）
    profitElement.textContent = isNaN(profit) ? '' : profit.toFixed(0); // 利益を整数で表示（未入力時は空文字列）
  });
});
