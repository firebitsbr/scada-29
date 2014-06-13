sourceData = @sourceData

UI.registerHelper 'dataValue', (name)->
    item = sourceData.findOne(name:name)
    if item
        {value: item.value, _id: item._id, name:name}
    else
        null

Template.yesNo.helpers
    getColor: (name)->
        item = sourceData.findOne(name:name)
        if item
            if item.value then 'green' else 'red'
        else
            'black'

Template.yesNo.events
    'click circle': (e,t)->
        Meteor.call 'Control', $(t.find('div')).attr('name')
        