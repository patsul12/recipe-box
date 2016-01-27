$(function() {
  var counter = 1;
  $(".ingredient").on("click", function() {
    var text = $(this).text();
    $('.ingredient-list').append($('<div/>', {'class': 'form-group'})
                         .append($('<input>', {'name': 'ingredient' + counter, 'class': 'form-control', 'value': text})));
    counter++;
  });

  $("#add-input-field").on("click", function() {
    $('.ingredient-list').append($('<div/>', {'class': 'form-group'})
                         .append($('<input>', {'name': 'ingredient' + counter, 'class': 'form-control'})));
    counter++;
  });

  $('#tag-input').tags({
    tagSize: "md",
    popovers: true
  });

  $('#tag-output').tags({
    tagSize: "sm"
  });
});
