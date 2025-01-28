import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="typeahead"
export default class extends Controller {
  static targets = ["input", "results"];
  static values = {
    url: String,
    minLength: { type: Number, default: 2 },
  };

  connect() {
    // Hide results when clicking outside
    document.addEventListener("click", (event) => {
      if (!this.element.contains(event.target)) {
        this.hideResults();
      }
    });

    // Handle keyboard navigation
    this.input.addEventListener("keydown", (event) => {
      if (!this.resultsTarget.firstElementChild) return;

      switch (event.key) {
        case "ArrowDown":
          event.preventDefault();
          this.selectNext();
          break;
        case "ArrowUp":
          event.preventDefault();
          this.selectPrev();
          break;
        case "Enter":
          event.preventDefault();
          this.selectResult();
          break;
        case "Escape":
          this.hideResults();
          break;
      }
    });
  }

  // Triggered by input event
  async search() {
    const query = this.inputTarget.value.trim();

    if (query.length < this.minLengthValue) {
      this.hideResults();
      return;
    }

    try {
      const response = await fetch(
        `${this.urlValue}?query=${encodeURIComponent(query)}`,
        {
          headers: {
            Accept: "application/json",
          },
        }
      );
      const locations = await response.json();

      let html = "";
      if (locations.length > 0) {
        html = locations
          .map(
            (location) => `
          <div class="p-2 hover:bg-gray-100 cursor-pointer"
               data-id="${location.id}"
               data-name="${location.name}">
            <div class="font-medium">${location.name}</div>
            <div class="text-sm text-gray-500">${location.formatted_address}</div>
          </div>
        `
          )
          .join("");
      } else {
        html = '<div class="p-2 text-gray-500">No locations found</div>';
      }

      this.resultsTarget.innerHTML = html;
      this.showResults();

      // Add click handlers to results
      this.resultsTarget.querySelectorAll("[data-id]").forEach((element) => {
        element.addEventListener("click", () => this.selectItem(element));
      });
    } catch (error) {
      console.error("Search failed:", error);
    }
  }

  // Handle selecting a result
  selectItem(element) {
    const id = element.dataset.id;
    const name = element.dataset.name;

    // Update the hidden input with the selected ID
    const hiddenInput = this.element.querySelector('input[type="hidden"]');
    if (hiddenInput) hiddenInput.value = id;

    // Update the search input with the selected name
    this.inputTarget.value = name;

    this.hideResults();
  }

  // Show the results dropdown
  showResults() {
    this.resultsTarget.classList.remove("hidden");
  }

  // Hide the results dropdown
  hideResults() {
    this.resultsTarget.classList.add("hidden");
  }

  // Keyboard navigation methods
  selectNext() {
    const current = this.resultsTarget.querySelector(".bg-gray-100");
    const next =
      current?.nextElementSibling || this.resultsTarget.firstElementChild;

    if (current) current.classList.remove("bg-gray-100");
    if (next) next.classList.add("bg-gray-100");
  }

  selectPrev() {
    const current = this.resultsTarget.querySelector(".bg-gray-100");
    const prev =
      current?.previousElementSibling || this.resultsTarget.lastElementChild;

    if (current) current.classList.remove("bg-gray-100");
    if (prev) prev.classList.add("bg-gray-100");
  }

  selectResult() {
    const selected = this.resultsTarget.querySelector(".bg-gray-100");
    if (selected) this.selectItem(selected);
  }
}
