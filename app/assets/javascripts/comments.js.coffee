jQuery ->
  # Create a comment
  $(".comment-form")
    .on "ajax:success", (event, data, status, xhr) ->
      $(this).find('textarea').val('');
      $(xhr.responseText).hide().insertAfter($(this)).show('slow')
