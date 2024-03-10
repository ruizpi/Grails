// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//

// CAMBIO PARA PONER BOOTSTRAP 5
// require jquery-3.6.0

// ESTE YA NO VALE
// require jquery-2.2.0.min
´
// CAMBIO PARA PONER BOOTSTRAP 5
//= require bootstrap.bundle

// ESTE YA NO VALE
// // require bootstrap


//= require_tree .
//= require_self
// CAMBIO PARA PONER 
//= require bootstrap.bundle

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}
