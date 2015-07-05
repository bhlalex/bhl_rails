function check_forgot_password_paramters() {
  var is_input_valid = true;
  if (($('#email').val() == null) || ($('#email').val() == '')){
    $('#email_error').removeClass("invisible_error_msg");
    $('#email_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
  
  if (($('#recaptcha_response_field').val() != undefined) && (($('#recaptcha_response_field').val() == null) || ($('#recaptcha_response_field').val() == ''))){
    $('#captcha_error').removeClass("invisible_error_msg");
    $('#captcha_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
    return is_input_valid;
}