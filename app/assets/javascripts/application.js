// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// turbolinks foi removido para os plugins recarregarem ao redirecionar a pag
// require turbolinks
//= require ckeditor/init
//= require twitter/bootstrap/
//= require twitter/bootstrap/modal
//= require jquery.remotipart
//= require cloudinary
//= require maskedinput

//= require_tree .

     


 function altScroll(altura) { // function centraliza pagina
    $('html').animate({scrollTop: altura}, 800);
  }

$(document).ready(function($) {
  
  //verificar o height da div body


  
  $('.menu-mapa-do-site ul li').click(function(){
     
    altScroll(290)
  });



  //banner
  $('.blueberry').blueberry();
  
  $(document).ajaxStart(function() {          
      $(".mascara").show();    
  });
  
  // posiciona a tela
  $(document).ajaxStop(function() {
    $(".mascara").hide();       
    
    
    
  });

  
  $('.menu ul li, .btn-like').click(function() {    
    altScroll(290);
  });  

  // add botão top
  $(window).scroll(function(){
    if($(this).scrollTop() > 200) {
      $('.btn-topo').fadeIn('fast');
    }
    else {
     $('.btn-topo').fadeOut('fast'); 
    }
  });

  // ao clicar no btn retorna para o topo

  $('.btn-topo').click(function(){
    $('html').animate({scrollTop: 0}, 800);
    return false;
  });

   $('.btn-topo').click(function(){     
    $('html body').animate({scrollTop: 0}, 800);
    return false;
  });  

// masrcara para o form phone
  var SPMaskBehavior = function (val) {
  return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
	},
		spOptions = {
		  onKeyPress: function(val, e, field, options) {
	      field.mask(SPMaskBehavior.apply({}, arguments), options);
	    }
	};

  $('#phone_telefone').mask(SPMaskBehavior, spOptions);
  $('#artist_data_phones_attributes_0_telefone').mask(SPMaskBehavior, spOptions);
  $('#commitment_telefone').mask(SPMaskBehavior, spOptions);
  
  
  
});



