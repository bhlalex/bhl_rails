function check_login_paramters() {
  var is_input_valid = true;
  if (($('#username').val() == null) || ($('#username').val() == '')){
    $('#username_error').removeClass("invisible_error_msg");
    $('#username_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
  
  if (($('#password').val() == null) || ($('#password').val() == '')){
    $('#password_error').removeClass("invisible_error_msg");
    $('#password_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
  if (($('#recaptcha_response_field').val() != undefined) && (($('#recaptcha_response_field').val() == null) || ($('#recaptcha_response_field').val() == ''))){
    $('#captcha_error').removeClass("invisible_error_msg");
    $('#captcha_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
    return is_input_valid;
}