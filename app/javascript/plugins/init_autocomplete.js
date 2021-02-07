// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';
const initAutocomplete = () => {
  const countryInput = document.getElementById('dragon_country');
  if (countryInput) {
    places({ container: countryInput });
  }
};
export { initAutocomplete };
