document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer_on')

  if (control) control.addEventListener('click', hideTimer)
})

function hideTimer() {
  var timer = document.getElementById('timer')
  if (timer.classList.contains('hide')) {
    timer.classList.remove('hide')
  } else {
    timer.classList.add('hide')
  }
}
