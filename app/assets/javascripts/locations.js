$(document).ready(function(){
  // define value variables
  var addressInput = $('#default_address')
  var current_value = addressInput.val();
  var default_value = "e.g. 1 Times Square";

  // clear field & remove class "example_text" when in focus
  addressInput.focus(function(){
    addressInput.removeClass('example_text');
    if (addressInput.val() == default_value) {
      addressInput.val('');
    } else {
      addressInput.select();
    }
  }); // end .focus

  addressInput.blur(function(){
    if (addressInput.val() == '' || addressInput.val() == default_value ) {
      addressInput.val(default_value);
      addressInput.addClass('example_text');
    } else {
      addressInput.removeClass('example_text');
    }
  }); // end .blur

  // add default txt & add class "example_text" when nil values on blur
}); // end document ready
