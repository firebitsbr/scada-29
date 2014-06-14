sourceData = @sourceData

UI.registerHelper 'dataValue', (variable)->
    item = sourceData.findOne(name:variable)
    if item
        this.value = item.value
        this._id = item._id
        this.variable = variable
        this
    else
        null

Template.yesNo.helpers
    getColor: (variable)->
        item = sourceData.findOne(name:variable)
        if item
            if item.value then 'green' else 'red'
        else
            'black'

Template.yesNo.events
    'click circle': (e,t)->
        Meteor.call 'Control', $(e.target).attr('variable')#$(t.find('div')).attr('name')
        

Template.swBasicPerecentage.helpers
    getWidth: (value) ->
        w = this.width
        w*value/100
    getColor: (value) ->
        if value >= 50
            'red'
        else
            'green'
    xPosText: ->
        this.width/2

Template.swVelocimeter.helpers
    x2 : (value)-> 
        alfa = value*2*Math.PI/100.0
        25+25.0*Math.cos(alfa)
    y2 : (value)-> 
        alfa = value*2*Math.PI/100.0
        25+25.0*Math.sin(alfa)