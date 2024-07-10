import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "subtotal", "price"]
  connect() {
    this.updateTotal();
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
    this.subtotalTargets.forEach(subtotal => {
      total += parseInt(subtotal.innerText);
    })
    document.querySelector(".cart-total").innerText = total;
  }
}
