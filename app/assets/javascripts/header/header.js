$(function(){
  $('.header_btn-a').click(function(){
    $('.header_btn-a').toggleClass('jq_trans');
    alert("本日はすでに投稿済みです。（ 投稿できるのは１日に１回のみです。)");
  });
});
