//= link_tree ../images
//= link_directory ../stylesheets .css


$(document).ready(function(){
    $('.single-item').slick({
 dots: true,
 infinite: true,
 speed: 300,
 slidesToShow: 1,
 centerMode: true,
});
   });