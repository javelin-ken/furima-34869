function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput,addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const fee = Math.floor(inputValue / 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${inputValue - fee}`   
  });
}

window.addEventListener('load', item_price);