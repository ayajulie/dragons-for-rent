import flatpickr from "flatpickr";

// flatpickr(".calendar", { console.log("World") });

const initFlatpickr = () => {

  const cal = document.querySelector(".calendar")
  console.log();
  flatpickr(cal, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: Date.now(),
    disable: JSON.parse(cal.dataset.unavailableDates)


  });
}

export { initFlatpickr };
