window.App = Ember.Application.create();

App.traffic = Ember.Object.create({
    sites: {
        1365: 'S&ouml;dra Station',
        1366: 'Wollmar Yxkullsg',
        1552: 'Luma',
        4633: 'Sickla Strand',
        9820: 'Sickla Udde'
    },
    isLoading: true,
    currentSiteId: function() { return this.get('isAfternoon') ? 1366 : 1552 }.property('isAfternoon'),
    currentSite: function() { return this.get('sites')[this.get('currentSiteId')] }.property('sites', 'currentSiteId'),
    isAfternoon: function() { return (new Date).getHours() >= 12 }.property(),
    departures: [],
    lastUpdateAt: function() { 
        var d=new Date;
        var pad=function(n){return n<10 ? '0'+n : n};
        return d.getFullYear() + "-" + pad(d.getMonth()+1) + '-' + pad(d.getDate()) + " " + pad(d.getHours()) + ':' + pad(d.getMinutes()) + ':' + pad(d.getSeconds());
    }.property('departures'),
    description: function() {
        return "Buss 74 från " + this.get('currentSite') + " i riktning " + (this.get('isAfternoon') ? "hemåt" : "mot jobbet")
    }.property('departures'),
    refresh: function() {
        $.ajax("/departures/" + App.traffic.get('currentSiteId') + ".json")
          .done(function(data) {
              deps = [];
              function rightDirection(o, afternoon) {
                  return (afternoon && !o.Destination.match("Mariatorget")) || (!afternoon && o.Destination.match("Mariatorget"));
              }
              for(var i=0; i<data.length; i++) {
                  if(rightDirection(data[i], App.traffic.get('isAfternoon'))) { deps.push(data[i]) }
                  if (deps.length == 3) break;
              }
              App.traffic.set('departures', deps);
              App.traffic.set('isLoading', false);
              setTimeout(App.traffic.refresh, 10000);
          })
          .fail(function() {
              setTimeout(App.traffic.refresh, 1000);
          })
    }
});

var view = Ember.View.create({
  templateName: 'departures'
});

view.append();
App.traffic.refresh();
