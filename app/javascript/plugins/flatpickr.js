import flatpickr from "flatpickr";

// flatpickr(".calendar", { console.log("World") });

// const initFlatpickr = () => {
//     flatpickr(".calendar", {
//       altInput: true,
//       altFormat: "F j, Y",
//       dateFormat: "Y-m-d",
//       minDate: Date.now(),
//       disable: JSON.parse(calendar.dataset.unavailableDates)
//     });
// };


const initFlatpickr = () => {
  const calendars = document.querySelectorAll(".calendar")
  calendars.forEach((calendar) => {
    flatpickr(".calendar", {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: Date.now(),
      disable: JSON.parse(calendar.dataset.unavailableDates)
    });
  });
};


export { initFlatpickr };
