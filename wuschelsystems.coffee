if Meteor.isClient

  Session.setDefault("CZ",5)
  Session.setDefault("CLZ",0)
  Session.setDefault("WUS",0)
  Session.setDefault("RZ",5)



  Template.wusCard.profile =
    'name': 'WUS'
    'description': 'Wuschel (WUS) proteins stimulate central zone (CZ) cell growth.'
    'icon': 'WUS'

  Template.clvCard.profile =
    'name': 'CLV'
    'description': 'Wuschel (WUS) proteins stimulate central zone (CZ) cell growth.'
    'icon': 'CLV'

  Template.czCard.profile =
    'name': 'CZ'
    'description': 'Wuschel (WUS) proteins stimulate central zone (CZ) cell growth.'
    'icon': 'CZ'

  Template.rzCard.profile =
    'name': 'RZ'
    'description': 'Wuschel (WUS) proteins stimulate central zone (CZ) cell growth.'
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
