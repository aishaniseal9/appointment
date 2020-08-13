# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'turbolinks:load', ->
 $('#to').select2
    ajax: {
      url: '/hospitals'
      data: (params) ->
        {
          search: params.search
        }
      dataType: 'json'
      delay: 500
      processResults: (data,params) ->
        {
        results:_.map(data,(el) ->
          { 
            name_highlight:el.Hname
            id:el.id
            name: "#{el.Hname}"
          }
      )
        }
      cache: true
        }
    escapeMarkup: (markup) -> markup
    templateResult: (item) -> item.name_highlight
    tenplateSelection: (item) ->item.name