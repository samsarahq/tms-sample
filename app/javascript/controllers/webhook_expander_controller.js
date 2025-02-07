import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "details", "icon"];

  toggle(event) {
    const button = event.currentTarget;
    const webhookId = button.dataset.webhookId;
    const details = this.detailsTargets.find(
      (el) => el.dataset.webhookId === webhookId
    );
    const icon = button.querySelector("[data-webhook-expander-target='icon']");

    details.classList.toggle("hidden");
    icon.classList.toggle("rotate-180");
    button.textContent = details.classList.contains("hidden")
      ? "Expand"
      : "Collapse";

    // Re-add the icon since we changed the button text
    button.appendChild(icon);
  }
}
