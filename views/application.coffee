updateTable = ->
  afternoon = ((new Date()).getHours() >= 12)
  site_id = if afternoon then 1366 else 1552
  sites =
    1365: 'S&ouml;dra Station'
    1366: 'Wollmar Yxkullsg'
    1552: 'Luma'
    4633: 'Sickla Strand'
    9820: 'Sickla Udde'
  $.getJSON "/departures/#{site_id}.json", (data) =>
      $('#loading').hide()
      t = "<table id='departures'>"
      t += "<tr id='row_#{row}'><td class='lineNumber'></td><td class='destination'></td><td class='time'></td></tr>" for row in [0..2]
      t += "</table>"
      $('#departures').replaceWith t
      $('#description').html "Buss 74 fr&aring;n #{sites[site_id]} i riktning #{if afternoon then 'hem&aring;t' else 'mot jobbet'}"
      row = 0
      for bus in data when (afternoon && !bus.Destination.match("Mariatorget")) || (!afternoon && bus.Destination.match("Mariatorget"))
          $("table#departures tr#row_#{row} td.lineNumber").text(bus.LineNumber)
          $("table#departures tr#row_#{row} td.destination").text(bus.Destination)
          $("table#departures tr#row_#{row} td.time").text(bus.DisplayTime)
          row += 1
          break if row > 2

resizeFont = -> $('body').css 'font-size', "#{Math.round($('table').width()/24)}px"

$(window).resize -> resizeFont()
setInterval updateTable, 30000

$ ->
  resizeFont()
  updateTable()
