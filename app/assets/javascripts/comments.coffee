$(document).ready ->
  $('.reply-comment-btn').click ->
    $(this).parents('.comment-footer').find('.reply-comment-form').toggleClass('hidden')
  $('.best_in_place').best_in_place()
