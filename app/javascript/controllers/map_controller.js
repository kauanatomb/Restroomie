import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = []
  static values = {
    apiKey: String,
    markers: Array,
    journeyShow: String,
    address: String,
    coordinates: String,


  }

  connect() {
    this.userCoordinates = []
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/ptrckbrd/clikbwk2300ez01pg0mrwapiu"
    })

    // disable zooming and panning initially
    this.map.scrollZoom.disable();
    this.map.dragPan.disable();

    // enable zooming and panning on first click
    this.map.on('click', () => {
      this.map.scrollZoom.enable();
      this.map.dragPan.enable();
    });

    if (this.map) {
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
      this.map.addControl(
        new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
        })
      );
    }

    const options = {
      enableHighAccuracy: true,
      timeout: 50000,
      maximumAge: 0,
    };

    const success = (pos) => {
      const crd = pos.coords;

      // console.log("Your current position is:");
      // console.log(`Latitude : ${crd.latitude}`);
      // console.log(`Longitude: ${crd.longitude}`);
      // console.log(`More or less ${crd.accuracy} meters.`);
      this.userCoordinates.push(crd.longitude)
      this.userCoordinates.push(crd.latitude)
    }

    const error = (err) => {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        // .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  navigation() {
    this.#getRoute(event.target.dataset.restroomlnglat)
  }
  // changed vnus to restrooms
  async #getRoute(restroomlatlng) {
    const restrooms = restroomlatlng.replace("[", "").replace("]", "").split(",")

    //const starter = "CURRENT_USER_LOCATION"
    // let userLocation = [13.391410, 52.506890]
    if (this.userCoordinates.length) {
      const addresses = `${this.userCoordinates[0]}, ${this.userCoordinates[1]} ; ${restrooms[0]}, ${restrooms[1]}`
      // console.log(addresses)
      const query = await fetch(
        `https://api.mapbox.com/directions/v5/mapbox/walking/${addresses}?steps=true&geometries=geojson&access_token=pk.eyJ1IjoicHRyY2ticmQiLCJhIjoiY2xpbXl3aWo3MHA5YjNqcGN1YjIxYnh2NiJ9.sgf0kRucW61e1gvLaFvp1w`,
        { method: 'GET' }
        );

      const json = await query.json();
      if (json.routes) {
        const data = json.routes[0];
        const route = data.geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };
        // remove existing route if it exists

        if (this.map.getLayer('route')) {
          this.map.removeLayer('route');
        }
        if (this.map.getSource('route')) {
          this.map.removeSource('route');
        }

        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#7c8d77',
            'line-width': 5,
            'line-opacity': 0.75
          }
        });

        const instructions = document.getElementById('instructions');
        const steps = data.legs[0].steps;

        // let tripInstructions = '';
        // setTimeout(this.#directions(steps, instructions, tripInstructions, data), 100);

      }

      // #directions = (steps, instructions, tripInstructions, data) => {
      //   for (const step of steps) {
      //     tripInstructions += `<div class="d-flex border h-3 justify-content-start" id="directions"><span>${this.#whichWay(step.maneuver.instruction)}</span>${step.maneuver.instruction}</div>`;
      //   }
      //   instructions.innerHTML = `<div id="header"><strong>Your trip duration: 🚶‍♂️ ${Math.floor(
      //     data.duration / 60
      //   )} min </strong></div><ul>${tripInstructions}</ul>`;
      // }

      // #whichWay(stepInstruction) {
      //   const instruction = stepInstruction.toLowerCase()

      //   if(instruction.includes("north") || instruction.includes("north")) {
      //     return "⬆️"
      //   }

      //   if((instruction.includes("continue"))) {
      //     return "⏫"
      //   }

      //   if((instruction.includes("east") || instruction.includes("right")) && (!instruction.includes("northwest") || !instruction.includes("northeast"))) {
      //     return  "➡️"
      //   }

      //   if((instruction.includes("northeast"))) {
      //     return "↗️"
      //   }

      //   if((instruction.includes("northwest"))) {
      //     return "↖️"
      //   }

      //   if((instruction.includes("south")) && (!instruction.includes("southwest") || !instruction.includes("southeast"))) {
      //     return  "⬇️"
      //   }

      //   if((instruction.includes("southwest"))) {
      //     return "↙️"
      //   }
      //   if((instruction.includes("southeast"))) {
      //     return "↘️"
      //   }

      //   if((instruction.includes("southwest"))) {
      //     return "↘️"
      //   }

      //   if((instruction.includes("west")) || (instruction.includes("left"))) {
      //     return "⬅️"
      //   }

      //   return "🚶"
      // }
    }
  }
}


// GEOCODING
// map.addControl(
//   new mapboxgl.GeolocateControl({
//   positionOptions: {
//   enableHighAccuracy: true
//   },
//   // When active the map will receive updates to the device's location as it changes.
//   trackUserLocation: true,
//   // Draw an arrow next to the location dot to indicate which direction the device is heading.
//   showUserHeading: true
//   })
//   );

// Option for driving route as well - just weighted differently???
