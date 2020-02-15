$(function(){
  function buildHTML(comment){
    var html =
    `<div class="comment-box">
      <div class="name">
        ${comment.nickname}
        さんからのコメント：
      </div>
      <div class="comment">
        ${comment.content}
      </div>
    </div>`
    return html;  
  }
  $(".form-a").on("submit",function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
     .done(function(data){
       var html = buildHTML(data);
       $('.comments-box').prepend(html);
       $('form')[0].reset();
       $('.comments-box').animate({ scrollTop: $('.comment-box')[0]});
       $('.submit-btm__size').prop('disabled', false);
     })
     .fail(function(){
      alert('送信に失敗しました');
    })
  });
});