$(function() {
  var counter = 1;
  $(".ingredient").on("click", function() {
    var text = $(this).text();
    $('.ingredient-list').append($('<div/>', {'class': 'form-group'})
                         .append($('<input>', {'name': 'ingredient' + counter, 'class': 'form-control', 'value': text, 'required': true})));
    counter++;
  });

  $("#add-input-field").on("click", function() {
    $('.ingredient-list').append($('<div/>', {'class': 'form-group'})
                         .append($('<input>', {'name': 'ingredient' + counter, 'class': 'form-control', 'required': true})));
    counter++;
  });

  $('#tag-input').tags({
    tagSize: "md",
    popovers: true
  });

  var tagData = [];

  $(".tag").each(function() {
    $("#tag-list").append($("<li/>")
                  .append($("<input>", {'name': 'tag'+counter, 'value': $(this).html()})));
    counter++;
  });

  $(".tag").each(function() {
    tagData.push($(this).text());
  });

  $('#tag-output').tags({
    readOnly: true,
    tagData: tagData,
    tagSize: "sm"
  });
});
