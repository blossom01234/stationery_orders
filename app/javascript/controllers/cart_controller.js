import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "subtotal"]

  update() {
    const quantity = parseFloat(this.quantityTarget.value) || 0;
    const price = parseFloat(this.priceTarget.dataset.price) || 0;
    const subtotal = (quantity * price).toFixed(2);

    this.subtotalTarget.textContent = subtotal;
  }
}
