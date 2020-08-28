window.addEventListener("load",function () {
  
  const value = document.getElementById("item-price");
  
  value.addEventListener("keyup", (e) => {
    
    const price  = value.value
   
    const num = price * 0.1 

    const sim = price-num
   
    const tax = document.getElementById("add-tax-price");
   
    tax.innerHTML = num

    const pro = document.getElementById("profit");
    pro.innerHTML = sim
  })
}) 