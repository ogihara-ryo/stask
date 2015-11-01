$ ->
  # id が入力されたら残りの入力欄に値を詰める
  $('input#category_id').change ->
    $.ajax({
      url: 'categories/set_form'
      type: 'GET'
      data: id: $(this).val()
    }).done (data, stat, xhr) ->
      set_form(data)

  # テーブルをクリックされたら入力欄に値を詰める
  $('tr[data-link]').click ->
    $.ajax({
      url: 'categories/set_form'
      type: 'GET'
      data: id: $(this).children('td:first').text()
    }).done (data, stat, xhr) ->
      set_form(data)

set_form = (data) ->
  $('input#category_id').val(data.id)
  $('input#category_number').val(data.number)
  $('input#category_name').val(data.name)
  $('input#category_color').val(data.color)
