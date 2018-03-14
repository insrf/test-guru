document.addEventListener('turbolinks:load', function() {
  var control = document.querySelectorAll('.coincidence')

  control[1].oninput = function() {
    var pass1 = document.getElementById("password").value
    var pass2 = document.getElementById("password_confirmation").value

    if (pass1 && (pass1 == pass2)) {
      document.getElementById("password").classList.add('green')
      document.getElementById("password_confirmation").classList.add('green')
    } else {
      document.getElementById("password").classList.remove('green')
      document.getElementById("password_confirmation").classList.remove('green')
      document.getElementById("password").classList.add('red')
      document.getElementById("password_confirmation").classList.add('red')
    }
  }
})
