function validatePasswordsMatch(){
	var y = document.forms["register"]["password"].value;
	var z = document.forms["register"]["confirm"].value;
	document["register"]["username"].value = document["register"]["username"].value.replace(/<\S[^><]*>/g, "");
	
	if(y != z || z == null || z == ""){
		alert("Passwords must match");
		document.forms["register"]["password"].focus;
		return false;
	}
	return true;
}

function validateTask(task){
	if(document["addItem"]["task"].value.length > 255){
		alert("Task too long! Please enter a maximum of 255 characters.");
		document["addItem"]["task"].focus();
		return false;
	}
	document["addItem"]["task"].value = document["addItem"]["task"].value.replace(/<\S[^><]*>/g, "");
	return true;
}
