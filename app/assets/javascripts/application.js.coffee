# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require vue
#= require vue-resource
#= require underscore
#= require js-routes
#= require autosize
#= require notify.min
#= require_tree .

$(document).ready ->
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')

  window.root_vue = new Vue(
    el: 'body'

    data: ->
      notifyStylesMap: {
        success: 'success'
        notice: 'warn'
        alert: 'error'
      }

    methods:
      notify: (response_data) ->
        noty_style = _.first(_.keys(response_data))

        $.notify response_data[noty_style], @notifyStylesMap[noty_style]
  )

  # Auto resize textarea
  autosize document.querySelectorAll('textarea')
