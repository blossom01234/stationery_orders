import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "table" ]

    addRow() {
        alert("test")
        const table = this.tableTarget;
        const template = document.getElementById('rowTemplate');
        const newRow = template.cloneNode(true);
        newRow.removeAttribute('id');
        newRow.style.display = '';
        const tbody = table.querySelector('tbody')
        tbody.appendChild(newRow);
    }

    deleteRow(event) {
        const button = event.currentTarget;
        const row = button.closest('tr')
        row.remove();
    }
}
