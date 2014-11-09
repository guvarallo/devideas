$ ->
  $('#ideas').imagesLoaded ->
    $('#ideas').masonry
      itemSelector: '.box'
      isFitWidth: true