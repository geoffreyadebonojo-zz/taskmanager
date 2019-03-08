// $( document ).ready(function() {
//
//   var children = $('.children');
//   var grandchildren = $('.grandchildren');
//   var ggchildren = $('.ggchildren');
//
//
//
//   $('.root').css({
//     "position": "relative",
//     "left": "40%",
//     "top": "0px"
//   });
//
//   for (var i = 0; i<children.length; i++){
//     $(`#child-${i}`).css({
//       "position": "relative",
//       "left": `${(100 / children.length*i )}%`,
//       "bottom": `${30 * i}px`,
//     })
//   }
//
//   for (var i = 0; i<grandchildren.length; i++){
//     var parentId = $(`#grandchild-${i}`).attr("parent");
//
//     for (var j = 0; j< children.length; j++){
//       if ( parentId == $(`#child-${j}`).attr("identifier") ){
//         var index = $(`#child-${j}`).attr("index");
//       }
//     }
//
//     if ($(`#grandchild-${i}`).attr("parent") == $(`#grandchild-${i+1}`).attr("parent")){
//       $(`#grandchild-${i}`).css({
//         "position": "relative",
//         "left": `${(100 / children.length*index) + 8}%`,
//         "bottom": `${30 * i}px`,
//       });
//       $(`#grandchild-${i+1}`).css({
//         "position": "relative",
//         "left": `${(100 / children.length*index) - 8}%`,
//         "bottom": `${30 * i}px`,
//       });
//     } else {
//       $(`#grandchild-${i}`).css({
//         "position": "relative",
//         "left": `${100 / children.length*index}%`,
//         "bottom": `${30 * i}px`,
//       });
//     }
//
//   }
//
// });
