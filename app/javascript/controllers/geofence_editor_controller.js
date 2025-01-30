import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    geofence: Object,
    latitude: Number,
    longitude: Number,
  };
  static targets = ["geofence"];

  connect() {
    this.checkGoogleMapsAndInit();
  }

  checkGoogleMapsAndInit() {
    if (typeof google === "undefined") {
      // If Google Maps isn't loaded yet, check again in 100ms
      setTimeout(() => this.checkGoogleMapsAndInit(), 100);
      return;
    }

    this.initMap();
  }

  initMap() {
    // Initialize the map centered on the location
    this.map = new google.maps.Map(this.element.querySelector("#map"), {
      center: { lat: this.latitudeValue, lng: this.longitudeValue },
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false,
      streetViewControl: false,
    });

    // Initialize drawing manager
    this.drawingManager = new google.maps.drawing.DrawingManager({
      drawingMode: null,
      drawingControl: false,
      polygonOptions: {
        editable: true,
        draggable: true,
        strokeColor: "#0066ff",
        strokeWeight: 2,
        fillColor: "#0066ff",
        fillOpacity: 0.2,
      },
    });
    this.drawingManager.setMap(this.map);

    // Load existing geofence if present
    if (this.geofenceValue) {
      let path;
      if (Array.isArray(this.geofenceValue)) {
        // Handle array format
        path = this.geofenceValue.map((coords) => ({
          lat: coords[0],
          lng: coords[1],
        }));
      } else if (
        this.geofenceValue.polygon &&
        this.geofenceValue.polygon.vertices
      ) {
        // Handle object format
        path = this.geofenceValue.polygon.vertices.map((vertex) => ({
          lat: vertex.latitude,
          lng: vertex.longitude,
        }));
      }

      if (path && path.length > 0) {
        this.currentPolygon = new google.maps.Polygon({
          paths: path,
          editable: true,
          draggable: true,
          strokeColor: "#0066ff",
          strokeWeight: 2,
          fillColor: "#0066ff",
          fillOpacity: 0.2,
        });
        this.currentPolygon.setMap(this.map);
        this.addPolygonListeners(this.currentPolygon);
      }
    }

    // Listen for polygon completion
    google.maps.event.addListener(
      this.drawingManager,
      "polygoncomplete",
      (polygon) => {
        if (this.currentPolygon) {
          this.currentPolygon.setMap(null);
        }
        this.currentPolygon = polygon;
        this.addPolygonListeners(polygon);
        this.updateGeofenceInput(this.getPolygonCoordinates(polygon));
        this.drawingManager.setDrawingMode(null);
      }
    );
  }

  startDrawing() {
    if (this.currentPolygon) {
      this.currentPolygon.setMap(null);
      this.currentPolygon = null;
    }
    this.drawingManager.setDrawingMode(google.maps.drawing.OverlayType.POLYGON);
  }

  clearGeofence() {
    if (this.currentPolygon) {
      this.currentPolygon.setMap(null);
      this.currentPolygon = null;
      this.updateGeofenceInput(null);
    }
  }

  addPolygonListeners(polygon) {
    // Update coordinates when polygon is edited or dragged
    google.maps.event.addListener(polygon.getPath(), "set_at", () => {
      this.updateGeofenceInput(this.getPolygonCoordinates(polygon));
    });
    google.maps.event.addListener(polygon.getPath(), "insert_at", () => {
      this.updateGeofenceInput(this.getPolygonCoordinates(polygon));
    });
    google.maps.event.addListener(polygon, "dragend", () => {
      this.updateGeofenceInput(this.getPolygonCoordinates(polygon));
    });
  }

  getPolygonCoordinates(polygon) {
    const vertices = [];
    const path = polygon.getPath();
    path.forEach((coord) => {
      vertices.push({
        latitude: coord.lat(),
        longitude: coord.lng(),
      });
    });

    return {
      polygon: {
        vertices: vertices,
      },
      settings: {
        showAddresses: false,
      },
    };
  }

  updateGeofenceInput(coordinates) {
    // First try to find an existing input field anywhere in the document
    let input = document.querySelector('input[name="location[geofence]"]');

    if (!input) {
      // If no input exists, create one and append it to the map's container
      input = document.createElement("input");
      input.type = "hidden";
      input.name = "location[geofence]";
      this.element.appendChild(input);
    }

    // Update the input value
    input.value = coordinates ? JSON.stringify(coordinates) : "";

    // Dispatch a custom event with the coordinates
    this.dispatch("geofenceChanged", { detail: coordinates });
  }
}
