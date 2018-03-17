document.addEventListener('turbolinks:load', function() {

  var elem = document.querySelector(".my-progress");

  if (elem) {
    var progress = elem.dataset.value
    elem.style.width = progress + '%';
  }

})
