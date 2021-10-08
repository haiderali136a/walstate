$(document).on("click", ".disable-user-modal", function () {
    var id = $(this).data('id');
    var username = $(this).data('name');
    var aactive = $(this).data('active');
    console.log(aactive)
    $(`#username_username`).html(`"${username}"`);
    url = `/user/${username}/disable/${id}`;
    $(`.form.${username}`).attr('action', url);
    $(`#active-confirm`).attr('value', (aactive, id));
  });