class Rating
  constructor: ->
    @$el = $(".rating input")

    @_bind()

  _bind: =>
    @$el.click @_formSend

  _formSend: (e) =>
    $('#new_rating')[0].submit ->
      $.ajax
        type: @method
        url: @action
        data: e.target.value

$ ->
  new Rating
