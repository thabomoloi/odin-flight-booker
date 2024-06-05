import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["card", "radio", "airport", "time"];

  connect() {
    this.radioTargets.forEach((radioTarget) => {
      radioTarget.addEventListener("change", this.handleRadioChange.bind(this));
    });
  }

  handleRadioChange(event) {
    // Clear background color from all cards
    this.cardTargets.forEach((cardTarget, index) => {
      cardTarget.classList.replace("bg-blue-50", "bg-white");
      cardTarget.classList.replace("border-blue-500", "border-transparent");

      this.airportTargets[index].classList.replace(
        "text-blue-800",
        "text-slate-800"
      );
      this.timeTargets[index].classList.replace(
        "text-blue-700",
        "text-slate-700"
      );
    });

    // Add background color to the selected card
    const selectedIndex = this.radioTargets.indexOf(event.target);
    this.cardTargets[selectedIndex].classList.replace("bg-white", "bg-blue-50");
    this.cardTargets[selectedIndex].classList.replace(
      "border-transparent",
      "border-blue-500"
    );
    this.airportTargets[selectedIndex].classList.replace(
      "text-slate-800",
      "text-blue-800"
    );
    this.timeTargets[selectedIndex].classList.replace(
      "text-slate-700",
      "text-blue-700"
    );
  }
}
