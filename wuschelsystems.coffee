if Meteor.isClient



  Template.wusCard.profile =
    'name': 'WUS'
    'description': 'WUSCHEL (WUS) proteins stimulate central zone (CZ) cell growth.'
    'icon': '<img src="wus.png"/>'

  Template.clvCard.profile =
    'name': 'CLV3'
    'description': "CLAVATA3 (CLV3) proteins inhibit the production of WUSCHEL proteins.

    They are the counter-balance to WUSCHEL's growth-promoting behavior."
    'icon': '<img src="clv.png"/>'

  Template.czCard.profile =
    'name': 'CZ'
    'description': 'Central zone (CZ) cells are stem cells, ready to be differentiated into other kinds of plant cells. '
    'icon': '<img class="czcell" src="czcell.png"/>'

  Template.rzCard.profile =
    'name': 'RZ'
    'description': 'Root zone (RZ) cells promote the formation of stem cells.

     The number of root zone cells stays constant.'
    'icon': '<img src="rzcell.png" />'


  Template.card.showIcon = () ->

    console.log this
    #console.log icon

    name = this.name
    icon = this.icon

    console.log name + "count"
    console.log Session.get(name + "count")
    if Session.get(name + "count")
      limit = Session.get(name + "count")
    else if Session.get(name + "count") is 0
      limit = 0
    else limit = 20


    console.log "limit is " + limit
    i = 0
    toShow = "<p>"
    while i < limit
      console.log "ich bin im Haus"
      toShow += icon
      toShow += " "
      i += 1
      if i % 5 is 0
       toShow += '</p><p>'

    toShow += '</p><p>'
    return toShow
