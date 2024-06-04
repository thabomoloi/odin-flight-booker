import { Controller } from "@hotwired/stimulus";

const card_styels = ["border-2", "border-blue-600", "bg-blue-50"];
const ariport_styles = ["text-blue-800"];
const time_styles = ["text-blue-700"];

export default class extends Controller {
  static targets = ["card", "radio", "airport", "time"];

  prevouslySelectedIndex = -1;

  connect() {
    this.radioTargets.forEach((radioTarget) => {
      radioTarget.addEventListener("change", this.handleRadioChange.bind(this));
    });
  }

  handleRadioChange(event) {
    // Clear background color from all cards

    this.cardTargets.forEach((cardTarget, index) => {
      cardTarget.classList.remove(...card_styels);
      this.airportTargets[index].classList.remove(...ariport_styles);
      this.timeTargets[index].classList.remove(...time_styles);
    });

    // Add background color to the selected card
    const selectedIndex = this.radioTargets.indexOf(event.target);
    this.cardTargets[selectedIndex].classList.add(...card_styels);
    this.airportTargets[selectedIndex].classList.add(...ariport_styles);
    this.timeTargets[selectedIndex].classList.add(...time_styles);
  }
}
