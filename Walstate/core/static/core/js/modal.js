$(document).on("click", ".delete-modal", function () {
  var id = $(this).data('id');
  var name = $(this).data('name');
  var type = $(this).data('type');
  $(`#${type}_name`).html(`"${name}"`);
  url = `/menu/${type}/delete/${id}`;
  $(`.form.${type}`).attr('action', url);
});