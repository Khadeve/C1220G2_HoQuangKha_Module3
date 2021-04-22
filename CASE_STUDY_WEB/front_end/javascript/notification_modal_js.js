let btn = document.getElementById("btn-modal");
let modal = document.getElementById("mymodal");
let closeButton = document.getElementsByClassName("close-modal")[0];

btn.addEventListener("click", function () {
  modal.style.display = "block";
});

closeButton.addEventListener("click", function () {
  modal.style.display = "none";
});

window.addEventListener("click", function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
});
