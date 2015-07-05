#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require analytics
#= require common
#= require facebook
#= require_tree .
#= require nav_sticker
#= require flash


$ ->
  NavSticker.add_nav($(".call-box"))