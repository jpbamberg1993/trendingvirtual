$(document).ready ->
  $('.reply-comment-btn').click ->
    $(this).parents('.comment-footer')
      .find('.reply-comment-form')
      .toggleClass('hidden')

  $('.best_in_place').best_in_place()

  $('.toggle-replies').click ->
    if this.innerHTML == 'Replies'
      replyState = 'Hide'
    else
      replyState = 'Replies'

    $(this).html(replyState)
    $(this).parents('.row').next('.comment-replies').toggleClass('hidden')

  $('.read-more').click (e) ->
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')

  $('.edit-btn').click (e) ->
    comment = $(this).parents('.comment-footer').siblings('.commentText')
      .find('a.hide')

    comment.parent().addClass('hide')
    comment.parent().siblings().removeClass('hide')

    comment.click()

  $('.read-less').click (e) ->
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')
