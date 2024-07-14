import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["quantity", "subtotal", "price"]
    connect() {
        this.updateTotal();
    }

    update() {

    }
}