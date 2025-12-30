const price = () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    const tax = inputValue * 0.10;
    const profit = inputValue - tax;
    document.getElementById('add-tax-price').textContent = Math.round(tax);
    document.getElementById('profit').textContent = Math.round(profit);
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);