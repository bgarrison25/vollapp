jQuery ->
  alert = jQuery(".alert")
  if alert.length > 0
    alert.show().animate
      height: 48
    , 200
    window.setTimeout (->
      alert.slideUp()
      return
    ), 3000
  return
