$(document).ready ->
  $('.reply-comment-btn').click ->
    $(this).parents('.comment-footer')
      .find('.reply-comment-form')
      .toggleClass('hidden')

  $('.best_in_place').best_in_place()

  $('.toggle-replies').click ->
    $(this).parents('.row').next('.comment-replies').toggleClass('hidden')

  $('.read-more').click (e) ->
    e.preventDefault()
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')

  $('.edit-btn').click (e) ->
    e.preventDefault()
    $(this).parents('.comment-footer').siblings('.commentText').find('.read-more').click()
    .siblings().click()
    .parents()
    .siblings().find('.read-less').addClass('hide')

  $('.read-less').click (e) ->
    e.preventDefault()
    $(this).parent().addClass('hide')
    $(this).parent().siblings().removeClass('hide')
