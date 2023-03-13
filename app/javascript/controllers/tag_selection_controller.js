import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tag-selection"
export default class extends Controller {
  static targets = ["checkbox", "rangeinput", "rangeresult", "first", "second", "third", "thirdbutton", "fourth", "five" ]
  connect() {
  }

  firstcheck(event) {
    event.currentTarget.firstChild.checked = true
    this.firstTargets.forEach(element => {
      element.classList.add("d-none")
    });
    this.secondTargets.forEach(element => {
      element.classList.remove("d-none")
    });
  }

  secondcheck(event) {
    event.currentTarget.firstChild.checked = true
    this.secondTargets.forEach(element => {
      element.classList.add("d-none")
    });
    this.thirdTargets.forEach(element => {
      element.classList.remove("d-none")
    });
    this.thirdbuttonTarget.classList.remove("d-none");
  }

  thirdcheck(event) {
    event.currentTarget.firstChild.checked = !event.currentTarget.firstChild.checked
    if (event.currentTarget.firstChild.checked) {
      event.currentTarget.querySelector(".card-tag-9").classList.add("selected")
    }
    else {
      event.currentTarget.querySelector(".card-tag-9").classList.remove("selected")
    }
  }

  thirdbuttoncheck(event) {

    event.currentTarget
    this.thirdTargets.forEach(element => {
      element.classList.add("d-none")
    });

    this.thirdbuttonTarget.classList.add("d-none")
    this.fourthTargets.forEach(element => {
      element.classList.remove("d-none")
    });
  }

  fourthcheck(event) {
    event.currentTarget.firstChild.checked = true
    this.fourthTargets.forEach(element => {
      element.classList.add("d-none")
    });
    this.fiveTarget.classList.remove("d-none")
  }




  changemin(event) {
    this.rangeresultminTarget.innerHTML = this.rangeinputminTarget.value
  }

  changemax(event) {
    this.rangeresultmaxTarget.innerHTML = this.rangeinputmaxTarget.value
  }
}

// <----------- js pour le range -------------->
function controlFromInput(fromSlider, fromInput, toInput, controlSlider) {
  const [from, to] = getParsed(fromInput, toInput);
  fillSlider(fromInput, toInput, '#C6C6C6', '#D49775', controlSlider);
  if (from > to) {
      fromSlider.value = to;
      fromInput.value = to;
  } else {
      fromSlider.value = from;
  }
}

function controlToInput(toSlider, fromInput, toInput, controlSlider) {
  const [from, to] = getParsed(fromInput, toInput);
  fillSlider(fromInput, toInput, '#C6C6C6', '#D49775', controlSlider);
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
fillSlider(fromSlider, toSlider, '#C6C6C6', '#D49775', toSlider);
if (from > to) {
  fromSlider.value = to;
  fromInput.value = to;
} else {
  fromInput.value = from;
}
}

function controlToSlider(fromSlider, toSlider, toInput) {
const [from, to] = getParsed(fromSlider, toSlider);
fillSlider(fromSlider, toSlider, '#C6C6C6', '#D49775', toSlider);
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
  const rangeDistance = to.max-to.min;
  const fromPosition = from.value - to.min;
  const toPosition = to.value - to.min;
  controlSlider.style.background = `linear-gradient(
    to right,
    ${sliderColor} 0%,
    ${sliderColor} ${(fromPosition)/(rangeDistance)*100}%,
    ${rangeColor} ${((fromPosition)/(rangeDistance))*100}%,
    ${rangeColor} ${(toPosition)/(rangeDistance)*100}%,
    ${sliderColor} ${(toPosition)/(rangeDistance)*100}%,
    ${sliderColor} 100%)`;
}

function setToggleAccessible(currentTarget) {
const toSlider = document.querySelector('#toSlider');
if (Number(currentTarget.value) <= 0 ) {
  toSlider.style.zIndex = 2;
} else {
  toSlider.style.zIndex = 0;
}
}

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
