window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input",() =>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const Tax = priceInput.value*0.1
    addTaxDom.innerHTML = Math.floor(Tax)
    const addProfitDom = this.document.getElementById("profit")
    const Profit = priceInput.value*0.9
    addProfitDom.innerHTML = Math.floor(Profit)
  })
})