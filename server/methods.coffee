fs = Npm.require('fs')

sourceData = @sourceData

Meteor.methods
    Control: (name, value)->
        item = sourceData.findOne(name:name)
        if item
            value = value or not item.value
            sourceData.update({name:name}, {$set: {value:value} })

f = ->
    fs.readFile '/home/miguel/data.data', {encoding: 'utf-8'}, Meteor.bindEnvironment (err, data)->
        console.log 'data:', data
        Meteor.call 'Control', 'balbula_1', if data == 'true' then true else false
Meteor.setInterval f, 1000