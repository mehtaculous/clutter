// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require typed.js/lib/typed
//= require turbolinks
//= require_tree .


// Sign up Modal
$(window).on('load',function() {
  if (localStorage.getItem('popState') != 'shown') {
    jQuery.noConflict();
    $('#myModal').modal('show');
    localStorage.setItem('popState','shown')
  }
});

// Animate Methods
var animateMethods = function() {
  var revealMethod = function() {
    $(this).css({
      opacity: 1,
      transform: 'scaleX(1) translateY(0)'
    });
  };
  
  $.each($('.method-box'), revealMethod);
};

// Animate Services
var animateServices = function() {
  var revealService = function() {
    $(this).css({
      opacity: 1,
      transform: 'scaleX(1) translateY(0)'
    });
  };
  
  $.each($('.process-box'), revealService);
};


$(document).on('turbolinks:load', function() {

  // Navbar color change on scroll
  $(window).scroll(function() {
    if ($(document).scrollTop() > 50) {
      $('.navbar-default').addClass('scroll');
      $('a.btn.btn-primary.sign-up').addClass('scroll');
    } else {
      $('.navbar-default').removeClass('scroll');
      $('a.btn.btn-primary.sign-up').removeClass('scroll');
    }
  });


  // Cluster header animation
  $('.header-content-inner h1').addClass('animated pulse');


  // Typed Animation
  var header = {
    strings: ["^300 One Bedroom at a Time^100", "^300 One Closet at a Time^100", "^300 One Living Room at a Time^100", "^300 One Kitchen at a Time^100", "^300 One Bathroom at a Time^100"],
    typeSpeed: 40,
    backSpeed: 10,
    smartBackspace: true,
    loop: true
  }

  var typed = new Typed(".header-content-inner .typed", header);


  // Nav link ease scroll to section
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top - 50)
        }, 1500, "easeInOutExpo");
        return false;
      }
    }
  });


  // Method box ease-in transition on scroll
  var scrollMethod = $('#method').offset().top - $(window).height() + 200;
  $(window).scroll(function(event) {
    if ($(window).scrollTop() >= scrollMethod) {
      animateMethods();
    }
  });


  // Service box ease-in transition on scroll
  var scrollDistance = $('#process').offset().top - $(window).height() + 200;
  $(window).scroll(function(event) {
    if ($(window).scrollTop() >= scrollDistance) {
      animateServices();
    }
  });


  // Testimonials fadeIn on scroll
  var scrollTweet = $('#team p').offset().top - $(window).height() + 500;
  $(window).scroll(function(event) {
    if ($(window).scrollTop() >= scrollTweet) {
      $('.testimonial .tweet').fadeIn(2000);
    }
  });

});
