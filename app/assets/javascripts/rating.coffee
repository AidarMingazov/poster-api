class Rating
  constructor: (el) ->
    @$el = $(el)
    @_init()

  _init: ->
    @$el.click @_onClick

  _onClick: (event) ->
    $("#rate-form-#{event.target.className} #rating_point").val(event.target.value)
    $("#rate-form-#{event.target.className}").submit()

new Rating(el) for el in $(".rating input")
