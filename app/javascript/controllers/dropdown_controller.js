import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  toggle() {
    this.menuTarget.classList.toggle("hidden");
  }

  // Close the dropdown when clicking outside
  connect() {
    this.clickOutsideHandler = this.clickOutside.bind(this);
    document.addEventListener("click", this.clickOutsideHandler);
  }

  disconnect() {
    document.removeEventListener("click", this.clickOutsideHandler);
  }

  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }
}
