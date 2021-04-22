// Get the open button
var openbtn = document.getElementById("openbtn");
// Get the modal
var modal = document.getElementById("mymodal");
// Get the modal content.
var form = document.getElementById("myform");
// Get the close button
var closebtn = document.getElementsByClassName("close")[0];
// Get the cancel button
var cancelbtn = document.getElementsByClassName("cancelbtn")[0];
// Get the delete button
var deletebtn = document.getElementsByClassName("deletebtn")[0];

openbtn.addEventListener("click", function () {
  modal.style.display = "block";
});

closebtn.addEventListener("click", function () {
  modal.style.display = "none";
});

cancelbtn.addEventListener("click", function () {
  modal.style.display = "none";
});

deletebtn.addEventListener("click", function () {
  myform.submit();
});
// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

if (document.getElementById("deleteConfirmation").value === "yes") {
  openbtn.click();
}
