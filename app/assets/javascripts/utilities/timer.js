document.addEventListener('turbolinks:load', setInterval(timer,1000))
function timer(){
 var elem=document.getElementById('timer_inp')
 elem.innerHTML--

 if(elem.innerHTML<0) {
   alert('timeout')
   var testPassageId = elem.dataset.value
   document.location.href= testPassageId + '/result'
 }
}
