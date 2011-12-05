$ ->
    $.getJSON '/departures.json', (data) ->
        buses = (bus for bus in data.DPS.Buses.DpsBus when bus.LineNumber is 74 && bus.Destination isnt "Mariatorget")
        next = buses[0].DisplayTime
        plusone = buses[1].DisplayTime
        $('#loading').hide()
        $('#next').html(next)
        $('#plusone').html(plusone)
        $('#loaded').show()
