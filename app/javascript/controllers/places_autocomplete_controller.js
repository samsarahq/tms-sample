import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.checkGoogleMapsAndInit();
  }

  checkGoogleMapsAndInit() {
    if (typeof google === "undefined") {
      // If Google Maps isn't loaded yet, check again in 100ms
      setTimeout(() => this.checkGoogleMapsAndInit(), 100);
      return;
    }

    this.initAutocomplete();
  }

  initAutocomplete() {
    if (this.autocomplete) return;

    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      types: ["address"],
      componentRestrictions: { country: ["us", "ca"] }, // Restrict to US and Canada
    });

    this.autocomplete.addListener("place_changed", () => this.placeSelected());
  }

  placeSelected() {
    const place = this.autocomplete.getPlace();

    if (!place.geometry) {
      console.warn("No location data available for this place");
      return;
    }

    // Update hidden fields with the selected place data
    const form = this.element.closest("form");
    form.querySelector("#location_formatted_address").value =
      place.formatted_address;
    form.querySelector("#location_latitude").value =
      place.geometry.location.lat();
    form.querySelector("#location_longitude").value =
      place.geometry.location.lng();

    // If the location name is empty, use the place name or first line of address
    const nameField = form.querySelector("#location_name");
    if (!nameField.value) {
      nameField.value = place.name || place.formatted_address.split(",")[0];
    }
  }

  disconnect() {
    if (this.autocomplete) {
      google.maps.event.clearInstanceListeners(this.autocomplete);
      this.autocomplete = null;
    }
  }
}
