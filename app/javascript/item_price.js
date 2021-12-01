window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  })
});
// 料金の表示
// 値段を入力すると、その値段をJSで取得する
// その取得した値段を元に計算を行う
// その計算した手数料などをJSを使って表示
