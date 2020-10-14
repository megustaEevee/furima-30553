function check() {
  const price = document.getElementById("item-price");
  price.addEventListener('keyup', () => {
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = price.value*0.1;
    const profit = document.getElementById("profit");
    profit.innerHTML = price.value*0.9;
  });
}

window.addEventListener('load',check);