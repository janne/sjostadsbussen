window.App = Ember.Application.create();

Traffic = Ember.Object.extend({
    sites: {
        1365: 'S&ouml;dra Station',
        1366: 'Wollmar Yxkullsg',
        1552: 'Luma',
        4633: 'Sickla Strand',
        9820: 'Sickla Udde'
    },
    currentSiteId: function() { return this.get('isAfternoon') ? 1366 : 1552 }.property('isAfternoon'),
    currentSite: function() { return this.get('sites')[this.get('currentSiteId')] }.property('sites', 'currentSiteId'),
    isAfternoon: function() { return (new Date()).getHours() >= 12 }.property(),
    departures: [],
    refresh: function() {
        $.getJSON("/departures/" + this.get('currentSiteId') + ".json", function(data) { App.traffic.set('departures', data) });
    }
});

// Setup
App.traffic = Traffic.create();
App.traffic.refresh();
setInterval(function() { App.traffic.refresh() }, 15000);
