sourceData = @sourceData
sourceDataHist = @sourceDataHist

Meteor.publish 'sourceData', ->
    sourceData.find()

Meteor.publish 'sourceDataHist', ->    
    sourceDataHist.find()