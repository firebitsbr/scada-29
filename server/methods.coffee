sourceData = @sourceData

g = (variable)->
    item = sourceData.findOne(name:variable)
    if item
        console.log 'g', not item.value
        not item.value
        

Meteor.methods
    Control: (variable) ->
        value = if g variable then 1 else 0
        HTTP.call 'GET', 'http://192.168.0.204:8080/set_balbula_1?value='+value
        

f = ->
    data = HTTP.call 'GET', 'http://192.168.0.204:8080/data'
    data = data.data
    console.log data
    for key, value of data
        sourceData.update({name: key}, {$set: {value: value } })

Meteor.setInterval f, 1000