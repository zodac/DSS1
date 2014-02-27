function validatePasswordsMatch(){
	var a = document["register"]["username"].value;
	var b = document["register"]["username"].value.replace(/<\S[^><]*>/g, "");
	
	var y = document.forms["register"]["password"].value;
	var z = document.forms["register"]["confirm"].value;
	
	if(a != b){
		alert("Invalid username!");
		document.forms["register"]["username"].focus();
		return false;
	}
	if(y != z || z == null || z == ""){
		alert("Passwords must match!");
		document.forms["register"]["password"].focus();
		return false;
	}
	if(y.length < 6){
		alert("Password must have at least 6 characters!");
		document.forms["register"]["password"].focus();
		return false;
	} 
	
	return true;
}

function validateTask(task){
	if(document["addItem"]["task"].value.length > 255){
		alert("Task too long!");
		document["addItem"]["task"].focus();
		return false;
	}
	document["addItem"]["task"].value = document["addItem"]["task"].value.replace(/<\S[^><]*>/g, "");
	return true;
}
