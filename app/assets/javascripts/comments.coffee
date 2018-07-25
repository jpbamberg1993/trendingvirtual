$(document).ready ->
  $('body').on('click', 'a.reply-comment-btn', ->
    $(this).parents('.comment-footer')
      .find('.reply-comment-form')
      .toggleClass('hidden')
  )

  $('.best_in_place').best_in_place()

  $('body').on('click', 'a.toggle-replies', ->
    if this.innerHTML == 'Replies'
      replyState = 'Hide'
    else
      replyState = 'Replies'

    $(this).html(replyState)
    $(this).parents('.row').next('.comment-replies').toggleClass('hidden')
  )

  $('body').on('click', 'a.read-more', ->
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')
  )

  $('body').on('click', 'a.read-less', ->
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')
  )

  $('body').on('click', 'a.edit-btn', ->
    comment = $(this).parents('.comment-footer').siblings('.commentText')
      .find('a.hide')

    comment.parent().addClass('hide')
    comment.parent().siblings().removeClass('hide')

    comment.click()
)
