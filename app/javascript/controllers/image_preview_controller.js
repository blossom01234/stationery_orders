import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
    static targets = ["input", "preview", "registeredImage"]
  
    connect() {
        this.inputTarget.addEventListener('change', this.showPreview.bind(this))
    }
  
    showPreview(event) {
      const file = event.target.files[0]
  
      if (file) {
        const reader = new FileReader()
  
        reader.onload = (e) => {
          this.previewTarget.src = e.target.result
          this.previewTarget.style.display = 'block'
          this.registeredImageTarget.src = ''
          this.registeredImageTarget.style.display = 'none'
        }
  
        reader.readAsDataURL(file)
      } else {
        this.previewTarget.src = ''
        this.previewTarget.style.display = 'none'
      }
    }

    clearPreview() {
        this.inputTarget.value= ''
        this.previewTarget.src = ''
        this.previewTarget.style.display = 'none'
    }
  }