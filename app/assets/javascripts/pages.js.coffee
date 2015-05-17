jQuery ->
  $("a[data-rel='tooltip-top']").tooltip(html: true)
  $("a[data-rel='tooltip-bottom']").tooltip(html: true)

  $('body').scrollspy({ target: '.navi-menu' })

$(document).ready ->
  window.viewportUnitsBuggyfill.init()

  $('#scrolldown, #navl-about').click ->
    $('html, body').animate { scrollTop: $('#about_area').offset().top }, 1000
    return
  $('#about-scrolldown, #navl-projects').click ->
    $('html, body').animate { scrollTop: $('#projects_area').offset().top }, 1000
    return
  $('#project-scrolldown, #navl-contact').click ->
    $('html, body').animate { scrollTop: $('#footer').offset().top }, 1000
  $('#navl-home').click ->
    $('html, body').animate { scrollTop: $('#background').offset().top }, 1000
    return
  return



$(window).scroll ->
  $('#nav, #mobile-nav').show()
  return

$(window).scroll ->
  $top = $(window).scrollTop()

  if $(window).scrollTop() == 0  && (window.location.href == "http://www.anfinity.co.uk/" || window.location.href == "http://localhost:3000/")
    $('#nav').hide()
    return

