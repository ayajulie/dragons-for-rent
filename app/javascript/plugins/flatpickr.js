import flatpickr from "flatpickr";
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

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
      disable: JSON.parse(calendar.dataset.unavailableDates),
    });
  });
};

const initBookFlatpickr = () => {
  const calendars = document.querySelectorAll(".book_calendar")
  calendars.forEach((calendar) => {
    flatpickr(".book_calendar", {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: Date.now(),
      disable: JSON.parse(calendar.dataset.unavailableDates),
    plugins: [new rangePlugin({ input: '#booking_end_date'})]
    });
  });
};

export { initFlatpickr };
export { initBookFlatpickr };
