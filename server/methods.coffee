sourceData = @sourceData

g = (variable)->
    item = sourceData.findOne(name:variable)
    if item
        not item.value
        

Meteor.methods
    Control: (variable) ->
        value = if g variable then 1 else 0
        HTTP.call 'GET', 'http://localhost:5000/set_balbula_1/'+value
        

f = ->
    data = HTTP.call 'GET', 'http://localhost:5000/data'
    data = data.data
    for key, value of data
        sourceData.update({name: key}, {$set: {value: value } })

Meteor.setInterval f, 1000