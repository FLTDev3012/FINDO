import { Controller } from "@hotwired/stimulus";

// toutes les targets
// Connects to data-controller="tag-selection"
export default class extends Controller {
  static targets = [
    "checkbox",
    "first",
    "second",
    "third",
    "thirdbutton",
    "fourth",
    "five",
    "rangeinputmin",
    "rangeinputmax",
    "rangeresultmin",
    "rangeresultmax",
  ];
  connect() {
    const fromSlider = document.querySelector('#fromSlider');
    const toSlider = document.querySelector('#toSlider');
    const fromInput = document.querySelector('#fromInput');
    const toInput = document.querySelector('#toInput');
    fillSlider(fromSlider, toSlider, '#C6C6C6', '#D49775', toSlider);
    setToggleAccessible(toSlider);

    fromSlider.oninput = () => controlFromSlider(fromSlider, toSlider, fromInput);
    toSlider.oninput = () => controlToSlider(fromSlider, toSlider, toInput);
    fromInput.oninput = () => controlFromInput(fromSlider, fromInput, toInput, toSlider);
    toInput.oninput = () => controlToInput(toSlider, fromInput, toInput, toSlider);

  }

  firstcheck(event) {
    // au premier enfant qui a un clic on passe a la suite et on passe la valeur a true
    event.currentTarget.firstChild.checked = true;
    // au clic on passe first en display none
    this.firstTargets.forEach((element) => {
      element.classList.add("d-none");
    });
    // on passe second en display normal
    this.secondTargets.forEach((element) => {
      element.classList.remove("d-none");
    });
  }

  secondcheck(event) {
    const input = event.currentTarget.querySelector("input")
    console.log(input)

    input.checked = true
    this.secondTargets.forEach(element => {
      element.classList.add("d-none")
    });
    this.thirdTargets.forEach((element) => {
      element.classList.remove("d-none");
    });
    this.thirdbuttonTarget.classList.remove("d-none");
  }

  thirdcheck(event) {
    // on inverse la valeur actuelle
    const input = event.currentTarget.querySelector("input")
    input.checked = !input.checked
    if (input.checked) {
      event.currentTarget.classList.add("selected")
    }
    else {

      event.currentTarget.classList.remove("selected")
    }
  }

  thirdbuttoncheck(event) {
    event.currentTarget;
    this.thirdTargets.forEach((element) => {
      element.classList.add("d-none");
    });

    this.thirdbuttonTarget.classList.add("d-none");
    this.fourthTargets.forEach((element) => {
      element.classList.remove("d-none");
    });
  }

  fourthcheck(event) {
    event.currentTarget.firstChild.checked = true;
    this.fourthTargets.forEach((element) => {
      element.classList.add("d-none");
    });
    this.fiveTarget.classList.remove("d-none");
  }

  // <----------- js pour le range -------------->
  // quand on bouge sur le champ d action de changerange  (<div class="range_container" data-action="mousemove->tag-selection#changerange">) (new.html.erb)
  // on appelle la fonction changemin et changemax pour modifier les valeurs
  changerange(event) {
    this.changemin();
    this.changemax();
  }
  changemin() {
    //  notre nouveau rangeresultmin (innerhtml)  et egal a --------> l input etait le carre moche avec la valeur et les fleches
    this.rangeresultminTarget.innerHTML = this.rangeinputminTarget.value;
  }

  changemax() {
    this.rangeresultmaxTarget.innerHTML = this.rangeinputmaxTarget.value;
  }
}

// <----------- js pour le range debase -------------->
function controlFromInput(fromSlider, fromInput, toInput, controlSlider) {
  const [from, to] = getParsed(fromInput, toInput);
  fillSlider(fromInput, toInput, "#C6C6C6", "#D49775", controlSlider);
  if (from > to) {
    fromSlider.value = to;
    fromInput.value = to;
  } else {
    fromSlider.value = from;
  }
}

function controlToInput(toSlider, fromInput, toInput, controlSlider) {
  const [from, to] = getParsed(fromInput, toInput);
  fillSlider(fromInput, toInput, "#C6C6C6", "#D49775", controlSlider);
  setToggleAccessible(toInput);
  if (from <= to) {
    toSlider.value = to;
    toInput.value = to;
  } else {
    toInput.value = from;
  }
}

function controlFromSlider(fromSlider, toSlider, fromInput) {
  const [from, to] = getParsed(fromSlider, toSlider);
  fillSlider(fromSlider, toSlider, "#C6C6C6", "#D49775", toSlider);
  if (from > to) {
    fromSlider.value = to;
    fromInput.value = to;
  } else {
    fromInput.value = from;
  }
}

function controlToSlider(fromSlider, toSlider, toInput) {
  const [from, to] = getParsed(fromSlider, toSlider);
  fillSlider(fromSlider, toSlider, "#C6C6C6", "#D49775", toSlider);
  setToggleAccessible(toSlider);
  if (from <= to) {
    toSlider.value = to;
    toInput.value = to;
  } else {
    toInput.value = from;
    toSlider.value = from;
  }
}

function getParsed(currentFrom, currentTo) {
  const from = parseInt(currentFrom.value, 10);
  const to = parseInt(currentTo.value, 10);
  return [from, to];
}

function fillSlider(from, to, sliderColor, rangeColor, controlSlider) {
  const rangeDistance = to.max - to.min;
  const fromPosition = from.value - to.min;
  const toPosition = to.value - to.min;
  controlSlider.style.background = `linear-gradient(
    to right,
    ${sliderColor} 0%,
    ${sliderColor} ${(fromPosition / rangeDistance) * 100}%,
    ${rangeColor} ${(fromPosition / rangeDistance) * 100}%,
    ${rangeColor} ${(toPosition / rangeDistance) * 100}%,
    ${sliderColor} ${(toPosition / rangeDistance) * 100}%,
    ${sliderColor} 100%)`;
}

function setToggleAccessible(currentTarget) {
  const toSlider = document.querySelector("#toSlider");
  if (Number(currentTarget.value) <= 0) {
    toSlider.style.zIndex = 2;
  } else {
    toSlider.style.zIndex = 0;
  }
}

// <----------- js pour le range de base fin-------------->
