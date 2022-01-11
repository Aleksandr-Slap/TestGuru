document.addEventListener('input', function () {
	var password_field = document.getElementById('password')
	var confirm_password_field = document.getElementById('confirm_password')

	if (confirm_password_field.value) {
		change_field_color(password_field, confirm_password_field)
	} 
	else {
		set_default_color(password_field, confirm_password_field)
	}
})

function change_field_color(password_field, confirm_password_field) {
	if (password_field.value === confirm_password_field.value) {
	  password_field.style.borderColor = 'green'
	  confirm_password_field.style.borderColor = 'green'
	  document.querySelector('.octicon-thumbsup').classList.remove('hide')
	  document.querySelector('.octicon-thumbsdown').classList.add('hide')
	}
	else {
	  password_field.style.borderColor = 'red'
	  confirm_password_field.style.borderColor = 'red'
	  document.querySelector('.octicon-thumbsdown').classList.remove('hide')
	  document.querySelector('.octicon-thumbsup').classList.add('hide')
	}
}

function set_default_color(password_field, confirm_password_field) {
  password_field.style.borderColor = "black"
  confirm_password_field.style.borderColor = "black"
}  