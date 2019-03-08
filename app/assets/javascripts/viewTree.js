$( document ).ready(function() {

  var children = $('.children');
  var grandchildren = $('.grandchildren');

  for (var i = 0; i<children.length; i++){
    $(`#child-${i}`).css({
      "position": "relative",
      "left": `${100 * i}px`,
      "bottom": `${30 * i}px`
    })
  }

  for (var i = 0; i<grandchildren.length; i++){
    var parentId = $(`#grandchild-${i}`).attr("parent");

    $(`#grandchild-${i}`).css({
      "position": "relative",
      "left": `${100 * parentId}px`,
      "bottom": `${30 * i}px`
    })
  }

  $('.root').css({
    "position": "relative",
    "left": "0%",
    "top": "0px"
  });



});
