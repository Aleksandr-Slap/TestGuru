import { TimeBar } from './utilities/TimeBar.js'

document.addEventListener('turbolinks:load', function () {
  const timerBar = document.getElementById('timer_bar')

  if (timerBar) new TimeBar('timer_bar')
})