(function($){
  $(function(){

    //$('.button-collapse').sideNav();
    $('.parallax').parallax();
    $('.button-collapse').sideNav({
      menuWidth: 240, // Default is 240
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteo 
    }
  );
  //$('.collapsible').collapsible();


  }); // end of document ready
})(jQuery); // end of jQuery name space


