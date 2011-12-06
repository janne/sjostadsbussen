updateTable = ->
  afternoon = ((new Date()).getHours() >= 12)
  site_id = if afternoon then 1366 else 1552
  $.getJSON "/departures/#{site_id}.json", (data) =>
      $('#loading').hide()
      t = "<table id='departures'>"
      t += "<tr id='row_#{row}'><td class='lineNumber'></td><td class='destination'></td><td class='time'></td></tr>" for row in [0..2]
      t += "</table>"
      $('#departures').replaceWith t
      row = 0
      for bus in data when (afternoon && !bus.Destination.match("Mariatorget")) || (!afternoon && bus.Destination.match("Mariatorget"))
          $("table#departures tr#row_#{row} td.lineNumber").text(bus.LineNumber)
          $("table#departures tr#row_#{row} td.destination").text(bus.Destination)
          $("table#departures tr#row_#{row} td.time").text(bus.DisplayTime)
          row += 1
          break if row > 2
      setTimeout updateTable, 5000

resizeFont = ->
  $('body').css 'font-size', "#{Math.round($('table').width()/24)}px"

$(window).resize -> resizeFont()

$ ->
  resizeFont()
  updateTable()
