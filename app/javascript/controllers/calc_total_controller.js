import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "subtotal", "price", "productId"]
  connect() {
    this.updateTotal();
    this.productIdTarget.addEventListener("input", this.fetchData.bind(this));
  }

  update() {
    const quantity = parseInt(this.quantityTarget.value) || 0;
    const price = parseInt(this.priceTarget.textContent) || 0;
    const subtotal = (quantity * price);

    this.subtotalTarget.textContent = subtotal;

    this.updateTotal();
  }

  updateTotal() {
    let total = 0;
    document.querySelectorAll(".subtotal").forEach(subtotal => {
      if (!isNaN(parseInt(subtotal.innerText))) {
        total += parseInt(subtotal.innerText);
      }
    })
    document.querySelector(".all-total").innerText = total;
    if (document.querySelector(".all-total-hidden")) {
      document.querySelector(".all-total-hidden").value = total;
    }
  }

  async fetchData() {
    const productId = this.productIdTarget.value
    const res = await fetch(`/products/price?product_id=${productId}`);
    console.log(res)
    const data = await res.json();
    console.log(data.price)
    this.priceTarget.innerText = data.price;
    this.update()
  }
}
