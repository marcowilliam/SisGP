(function($){

	$(function(){
        
            	 $('.datepicker').datepicker({
			    	format: 'dd/mm/yyyy',
			    	language: 'pt-BR',
			    	weekStart: 0,
			    	startDate:'0d',
			    	todayHighlight: true
			    });
              $('.datepicker').datepicker();

            $('.parallax').parallax();
    }); // end of document ready

})(jQuery); // end of jQuery name space
