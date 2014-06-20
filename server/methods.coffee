sourceData = @sourceData
sourceDataHist = @sourceDataHist
url = 'http://localhost'
url = 'http://192.168.0.204'
#g = (variable)->
#    item = sourceData.findOne(name:variable)
#    if item
#        console.log 'g', not item.value
#        not item.value
        

Meteor.methods
    Control: (variable) ->
        HTTP.call 'POST', url+':8080/set', data:{var: 'balbula_1'}
        

f = ->
    data = HTTP.call 'GET', url+':8080/data'
    data = data.data
    for key, value of data
        if key != 'time'
            sourceData.update({name: key}, {$set: {value: value } })
    
h = ->
    data = HTTP.call 'GET', url+':8080/data'
    data = data.data
    sourceDataHist.insert({name: 'input1', value: data['input1'], time: data['time'] } )    

    corte = moment.utc().add('minutes', -15).unix()
    console.log 'limpiando', corte
    console.log sourceDataHist.remove({time: {$lte: corte}})



Meteor.setInterval f, 1000
Meteor.setInterval h, 60*1000