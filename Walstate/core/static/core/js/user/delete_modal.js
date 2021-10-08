$(document).on("click", ".delete-modal", function () {
    var id = $(this).data('id');
    var username = $(this).data('username');
    var type = $(this).data('type');
    $(`#${type}_username`).html(`"${username}"`);
    url = `/${type}/delete/${id}/`;
    $(`.form.${type}`).attr('action', url);
  });