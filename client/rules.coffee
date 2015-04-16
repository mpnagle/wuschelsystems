Template.play.events
  'click #play': () ->
    playAllSteps()

step1 = () ->
  console.log "step1"

step2 =  () ->
  console.log "step2"

step3 = () ->
  console.log "step3"

step4 = () ->
  console.log "step4"

step5 = () ->
  console.log "step5"

allSteps = ->
  Meteor.setTimeout(step1,500)
  Meteor.setTimeout(step2,1000)
  Meteor.setTimeout(step3,1500)
  Meteor.setTimeout(step4,2000)
  Meteor.setTimeout(step5,2500)


playAllSteps = () ->

  Meteor.setInterval allSteps,2500
