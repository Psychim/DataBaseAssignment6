function formatcontrol(formId){
  var form = document.getElementById(formId);  
  var elements = new Array();  
  var tagElements = form.getElementsByTagName('input');  
  
  var firstcharpat = new RegExp("[a-zA-Z]");
  var contentpat = new RegExp("^[a-zA-Z_0-9]*$");
  var emailpat = new RegExp("^\\w+@\\w+(\\.\\w+)+$");
 
  for (var j = 0; j < tagElements.length; j++){ 
     elements.push(tagElements[j].value); 
  } 
  switch(formId){
      case 'login-form':
      var username=elements[0];
      var password=elements[1];
      var result = VerifyUsername(username,firstcharpat,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid username length. At least 1 character and at most 32. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The first character of username should be a letter </p>"+
          "</div>";
          return false;
          break;
          case 3:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Username can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyPassword(password,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid password length. At least 6 character and at most 64. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Password can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
          return true;
      }
      break;
      case 'forgotton-password':
      var username=elements[0];
      var email=elements[1]
      var password=elements[2];
      var confirm=elements[3];
      var result = VerifyUsername(username,firstcharpat,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid username length. At least 1 character and at most 32. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The first character of username should be a letter </p>"+
          "</div>";
          return false;
          break;
          case 3:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Username can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyEmail(email,emailpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid email length. At least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The format of email wrong. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyPassword(password,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid password length. At least 6 characters and at most 64. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Password can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      if(password!=confirm)
      {
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
              "<p> Confirm password should be the same as password. </p>"+
              "</div>";
          return false;
      }
      return true;
      break;
      case "reg-page":
      var firstname=elements[0];
      var lastname=elements[1];
      var username=elements[2];
      var email=elements[3]
      var password=elements[4];
      var confirm=elements[5];
      var result = VerifyName(firstname);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Your first name should be at least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyName(lastname);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Your last name should be at least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyUsername(username,firstcharpat,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid username length. At least 1 character and at most 32. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The first character of username should be a letter </p>"+
          "</div>";
          return false;
          break;
          case 3:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Username can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyEmail(email,emailpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid email length. At least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The format of email wrong. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyPassword(password,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid password length. At least 6 characters and at most 64. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Password can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      if(password!=confirm)
      {
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Confirm password should be the same as password. </p>"+
          "</div>";
          return false;
      }
      return true;
      break;
      case "user-form":
      var firstname=elements[0];
      var lastname=elements[1];
      var email=elements[2]
      var password=elements[3];
      var confirm=elements[4];
      var result = VerifyName(firstname);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Your first name should be at least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyName(lastname);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Your last name should be at least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      var result = VerifyEmail(email,emailpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid email length. At least 1 character and at most 255. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> The format of email wrong. </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      if(password==""&&confirm=="")
          return true;
      var result = VerifyPassword(password,contentpat);
      switch(result)
      {
          case 1:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Invalid password length. At least 6 characters and at most 64. </p>"+
          "</div>";
          return false;
          break;
          case 2:
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-8 col-md-offset-2 alert alert-danger margin-top-20'>"+
          "<p> Password can only be made up of letters and numbers </p>"+
          "</div>";
          return false;
          break;
          case 0:
          document.getElementById("Warning-message").innerHTML="";
      }
      if(password!=confirm)
      {
          document.getElementById("Warning-message").innerHTML="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
              "<p> Confirm password should be the same as password. </p>"+
              "</div>";
          return false;
      }
      return true;
  }
}

function VerifyUsername(username,firstcharpat,contentpat)
{
    if(username.length<=0||username.length>32)
        return 1;
    var firstchar = username.substring(0,1);
    var m=firstchar.match(firstcharpat);
    if(m==null)
         return 2;
    m=username.match(contentpat);
    if(m==null)
        return 3;
    return 0;
}

function VerifyPassword(password,contentpat)
{
    if(password.length<6||password.length>64)
        return 1;
    var m=password.match(contentpat);
    if(m==null)
        return 2;
    return 0;
}

function VerifyEmail(email,emailpat)
{
    if(email.length<=0||email.length>255)
        return 1;
    var m=email.match(emailpat);
    if(m==null)
        return 2;
    return 0;
}

function VerifyName(name)
{
    if(name.length<=0||name.length>255)
        return 1;
    return 0;
}