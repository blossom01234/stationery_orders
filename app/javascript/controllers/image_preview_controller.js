import { Controller } from "@hotwired/sitmulus"

export default class extends Controller {
    static target  = ["input", "preview"]

    connect() {
        this.inputTarget.addEventListener('chage', this.showPreview.bind(this))
    }

    showPreview(event) {
        const file = event.target.files[0]

        if (file) {
            const reader = new FileReader()

            reader.onload = ()
        }
    }
}