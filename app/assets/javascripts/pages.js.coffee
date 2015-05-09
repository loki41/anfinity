jQuery ->
  $("a[data-rel='tooltip-top']").tooltip(html: true)
  $("a[data-rel='tooltip-bottom']").tooltip(html: true)




$(document).ready ->
  $('#scrolldown').click ->
    $('html, body').animate { scrollTop: $('#about_area').offset().top }, 1000
    return
  $('#about-scrolldown').click ->
    $('html, body').animate { scrollTop: $('#projects_area').offset().top }, 1000
    return
  $('#project-scrolldown').click ->
    $('html, body').animate { scrollTop: $('#footer').offset().top }, 1000
    return
  return
