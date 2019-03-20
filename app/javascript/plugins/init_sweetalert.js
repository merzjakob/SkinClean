import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  if (document.querySelector(selector)) { // protect other pages
    const swalButton = document.querySelectorAll(selector).forEach((diagnosis) => {
      diagnosis.addEventListener('click', () => {
        swal(options);
      });
    });
  };
};

export { initSweetalert };
