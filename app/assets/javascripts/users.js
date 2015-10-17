// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


document.addEventListener("DOMContentLoaded", function() {
    var $acceptCheckbox = $('#acceptConditions');
    var $submit = $('#submit');
    var $allInputs = $('input');

    // The button should be disabled when loading the site
    $submit.prop('disabled', true);

    // Enalbe the button if the user has accepted the conditions
    $acceptCheckbox.on('change', function(event) {
        if ($acceptCheckbox[0].checked) {
            $submit.removeClass('disabled');
            $submit.prop('disabled', false);
        } else {
            $submit.addClass('disabled');
            $submit.prop('disabled', true);
        }
    });
});