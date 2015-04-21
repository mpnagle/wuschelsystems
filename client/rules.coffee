Session.setDefault("RZcount", 5)
Session.setDefault("CZcount", 5)
Session.setDefault("WUScount", 0)
Session.setDefault("CLV3count", 0)
Session.setDefault("highlightedStep",0)


Template.play.events
  'click #play': () ->
    console.log "play"
    #playAllSteps()
    generateData()

globalData =
  'WUS': []
  'CLV3': []
  'CZ': []
  'RZ': []

Session.setDefault("globalData", globalData)
updateData = ->

  globalData['WUS'].push(Session.get("WUScount"))
  globalData['CLV3'].push(Session.get("CLV3count"))
  globalData['CZ'].push(Session.get("CZcount"))
  globalData['RZ'].push(Session.get("RZcount"))

  console.log globalData

  Session.set("globalData", globalData)


generateData = ->

  globalData =
    'WUS': []
    'CLV3': []
    'CZ': []
    'RZ': []
  i = 0
  limit = 3
  while i < limit

    step1()
    step2()
    step3()
    step4()
    step5()
    i = i + 1

step1 = () ->
  RZcount = Session.get("RZcount")
  WUScount = Session.get("WUScount")

  Session.set("WUScount", 2*RZcount + WUScount)

  updateData()

step2 =  () ->
  CLVcount = Session.get("CLV3count")

  CLVcount = CLVcount - (CLVcount % 10)
  newWUS = Session.get("WUScount") - CLVcount / 10
  if newWUS < 0 then newWUS = 0

  Session.set("WUScount",newWUS)
  Session.set("CLV3count",0)

  updateData()

step3 = () ->

  WUScount = Session.get("WUScount")
  CZcount = Session.get("CZcount")

  Session.set("CLV3count", WUScount * CZcount)

  updateData()

step4 = () ->

  WUScount = Session.get("WUScount")
  newCZ = (WUScount - (WUScount % 2) ) / 2

  CZcount = Session.get("CZcount")
  Session.set("CZcount", CZcount + newCZ)

  Session.set("WUScount",0)

  updateData()

step5 = () ->

  CZcount = Session.get("CZcount")
  Session.set("CZcount", CZcount - 2)

  updateData()

allSteps = ->
  Meteor.setTimeout(step1,500)
  Meteor.setTimeout(step2,1000)
  Meteor.setTimeout(step3,1500)
  Meteor.setTimeout(step4,2000)
  Meteor.setTimeout(step5,2500)


playAllSteps = () ->

  Meteor.setInterval allSteps,2500
