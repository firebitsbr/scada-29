sourceData = @sourceData
sourceDataHist = @sourceDataHist
url = process.env.IP_DA

Meteor.methods
    Control: (variable) ->
        HTTP.call 'POST', url+'/set', {params: {var: 'balbula_1'}}
        

f = ->
    data = HTTP.call 'GET', url+'/data'
    data = data.data
    for key, value of data
        if key != 'time'
            sourceData.update({name: key}, {$set: {value: value } })
    
h = ->
    data = HTTP.call 'GET', url+'/data'
    data = data.data
    sourceDataHist.insert({name: 'input1', value: data['input1'], time: data['time'] } )    

    corte = moment.utc().add('minutes', -3).unix()
    console.log 'limpiando', corte
    console.log sourceDataHist.remove({time: {$lte: corte}})



Meteor.setInterval f, 1000
Meteor.setInterval h, 500