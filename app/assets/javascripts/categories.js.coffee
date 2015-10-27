$ ->
  $('input#category_id').change ->
    $.ajax({
      url: 'categories/set_id'
      type: 'GET'
      data: id: $(this).val()
    }).done (data, stat, xhr) ->
      $('input#category_number').val(data.number)
      $('input#category_name').val(data.name)
      $('input#category_color').val(data.color)
