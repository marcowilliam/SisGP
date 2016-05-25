(function($){
  

  $(function(){

    $('select').material_select();
      
 $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year
    format: 'yyyy-mm-dd',
    monthsFull: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Decembro'],
    monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dec'],
    weekdaysFull: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
    weekdaysShort: ['D', 'M', 'T', 'Q', 'Q', 'S', 'S'],
    showMonthsShort: false,


      // Buttons
    today: 'Hoje',
    clear: 'Limpar',
    close: 'Fechar'
  });
    //$('.button-collapse').sideNav();
    $('.parallax').parallax();
    $('.button-collapse').sideNav({
      menuWidth: 240, // Default is 240
      closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteo 
      // Strings and translations
   
    }
  );
  //$('.collapsible').collapsible();


  }); // end of document ready


})(jQuery); // end of jQuery name space


