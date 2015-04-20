if Meteor.isClient

  Session.setDefault("CZ",5)
  Session.setDefault("CLZ",0)
  Session.setDefault("WUS",0)
  Session.setDefault("RZ",5)



  Template.wusCard.profile =
    'name': 'WUS'
    'description': 'WUSCHEL (WUS) proteins stimulate central zone (CZ) cell growth.'
    'icon': 'WUS'

  Template.clvCard.profile =
    'name': 'CLV3'
    'description': "CLAVATA3 (CLV3) proteins inhibit the production of WUSCHEL proteins.

    They are the counter-balance to WUSCHEL's growth-promoting behavior."
    'icon': 'CLV'

  Template.czCard.profile =
    'name': 'CZ'
    'description': 'Central zone (CZ) cells are stem cells, ready to be differentiated into other kinds of plant cells. '
    'icon': '<img src="czcell.png"/>'

  Template.rzCard.profile =
    'name': 'RZ'
    'description': 'Root zone (RZ) cells promote the formation of stem cells.

     The number of root zone cells stays constant.'
    'icon': 'RZ'


  Template.card.showIcon = () ->

    console.log this
    #console.log icon

    name = this.name
    icon = this.icon
    if Session.get(name)
      limit = Session.get(name)
    else limit = 20

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
