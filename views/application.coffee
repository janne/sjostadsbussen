$ ->
    $.getJSON '/departures.json', (data) ->
        $('#loading').hide()
        t = "<table id='departures'>"
        t += "<tr id='row_#{row}'><td class='lineNumber'></td><td class='destination'></td><td class='time'></td></tr>" for row in [0..2]
        t += "</table>"
        $('#departures').replaceWith t
        row = 0
        for bus in data.DPS.Buses.DpsBus when bus.LineNumber is 74 && bus.Destination is "Mariatorget"
            $("table#departures tr#row_#{row} td.lineNumber").text(bus.LineNumber)
            $("table#departures tr#row_#{row} td.destination").text(bus.Destination)
            $("table#departures tr#row_#{row} td.time").text(bus.DisplayTime)
            row += 1
