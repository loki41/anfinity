//= require navbar

document.addEventListener("DOMContentLoaded", function () {
  // Nav change on scroll
  const navbar = document.querySelector(".navbar");
  const isHomePage = document.body.classList.contains("home");
  const isProjectPage = document.body.classList.contains("show");

  if (isHomePage || isProjectPage) {
    const scrollTrigger = isHomePage ? window.innerHeight : window.innerHeight * 0.6;

    window.addEventListener("scroll", () => {
      if (window.scrollY > scrollTrigger) {
        navbar.classList.add("navbar--scrolled");
      } else {
        navbar.classList.remove("navbar--scrolled");
      }
    });
  } else {
    navbar.classList.add("navbar--scrolled");
  }


  // Mobile Nav
  const nav = document.querySelector('.mobile-nav');
  const toggle = document.querySelector('.mobile-nav__toggle');

  if (toggle && nav) {
    toggle.addEventListener('click', () => {
      if (nav.classList.contains('open')) {
        document.querySelector('.mobile-nav').classList.add('open');
      } else {
        document.querySelector('.mobile-nav').classList.remove('open');
      }
    });
  }


  // Nav Button
  const profileButton = document.getElementById('menu-button');
  const dropdownContainer = profileButton?.closest('.nav-profile-dropdown');

  if (profileButton && dropdownContainer) {
    profileButton.addEventListener('click', (e) => {
      dropdownContainer.classList.add('open');
      e.stopPropagation();
    });

    document.addEventListener('click', (e) => {
      if (!dropdownContainer.contains(e.target)) {
        dropdownContainer.classList.remove('open');
      }
    });
  }

});
