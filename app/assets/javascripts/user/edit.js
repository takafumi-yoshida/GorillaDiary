$(function(){
  $("button").on("click", function(){
    $(".form-contents__wrapper").fadeIn(1000);
    $('.edit-btn').prop('disabled', false);
  });
  $(".edit-btn").on("click", function(){
    
    $(".form-contents__wrapper").fadeOut(500);
    
  });
});