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

  var tagData = [];

  $("#tag-list").empty();
  $(".tag").each(function() {
    $("#tag-list").append($("<li/>")
                  .append($("<input>", {'name': 'tag'+counter, 'value': $(this).html()})));
    counter++;
  });

  $(".tag").each(function() {
    tagData.push($(this).text());
  });

  $('#tag-output').tags({
    tagData: tagData,
    tagSize: "sm"
  });
});
