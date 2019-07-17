const initUpdateNavbarOnScroll = () => {
  console.log("navbar function");
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.banner');
  if (navbar && banner) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= banner.offsetHeight ) {
        navbar.classList.add('navbar-lewagon-blue');
      } else {
        navbar.classList.remove('navbar-lewagon-blue');
      }
    });
  } else {
    navbar.classList.add('navbar-lewagon-blue');
  }
}

export { initUpdateNavbarOnScroll };
