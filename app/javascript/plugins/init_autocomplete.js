import places from 'places.js';

const initAutocomplete = () => {

  const addressInput = document.getElementById('search_query');
  console.log(addressInput)
  if (addressInput) {
    places({ container: addressInput, type: ['city', 'address'] });
  }
};

export { initAutocomplete };
