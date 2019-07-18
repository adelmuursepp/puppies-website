import places from 'places.js';

const initAutocomplete = () => {

  const addressInput = document.getElementById('puppy_address');
  if (addressInput) {
    places({ container: addressInput, type: ['city', 'address'] });
  }
};

export { initAutocomplete };
