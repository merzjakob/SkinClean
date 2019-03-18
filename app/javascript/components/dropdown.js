const showDropdown = () => {
  if (document.querySelector(".medicine-card-visible")) {
    const dropdown = document.querySelectorAll(".medicine-card-visible").forEach((medicine) => {
    medicine.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("medicine-card-invisible");
      event.currentTarget.classList.toggle("medicine-card-visible");
    });
  });
  }
};

export {showDropdown};
