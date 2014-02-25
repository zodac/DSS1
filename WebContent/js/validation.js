function validateLoginForm() {
	var x = document.forms["flogin"]["userName"].value;
	var y = document.forms["flogin"]["password"].value;
	if (x == null || x == "" || y == null || y == "") {
		alert("Username and Password must be filled out");
		return false;
	}
}

function validateRegistrationForm(){
	var x = document.forms["register"]["username"].value;
	var y = document.forms["register"]["password"].value;
	var z = document.forms["register"]["confirm"].value;
	
	if(x == null || x == "" || y == null || y == ""){
		alert("Username and password must be entered");
		return false;
	}
	if(y != z || z == null || z == ""){
		alert("Passwords must match");
		return false;
	}
}

