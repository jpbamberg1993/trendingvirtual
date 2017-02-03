$(document).ready ->
  $('.reply-comment-btn').click ->
    $(this).parents('.comment-footer').find('.reply-comment-form').toggleClass('hidden')
  $('.best_in_place').best_in_place()
jQuery ->
  minimized_elements = $('p.minimize')
  minimized_elements.each ->
    t = $(this).text()
    if t.length < 300
      return
    $(this).html t.slice(0, 300) + '<span>... </span><a href="#" class="more">Read More</a>' + '<span style="display:none;">' + t.slice(300, t.length) + ' <a href="#" class="less">Read Less</a></span>'
  $('a.more', minimized_elements).click (event) ->
    event.preventDefault()
    $(this).hide().prev().hide()
    $(this).next().show()
    return
  $('a.less', minimized_elements).click (event) ->
    event.preventDefault()
    $(this).parent().hide().prev().show().prev().show()