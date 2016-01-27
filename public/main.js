$(function() {
  $(".ingredient").on("click", function() {
    var text = $(this).text();
    $('.ingredient-list').append($('<input>', {'class': 'form-control', 'value': text}));
  })

  $("#add-input-field").on("click", function() {
    $('.ingredient-list').append($('<div/>', {'class': 'form-group'})
                   .append($('<input>', {'class': 'form-control'})));
  })
});
