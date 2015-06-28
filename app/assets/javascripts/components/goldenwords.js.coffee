@Goldenwords = React.createClass
    getInitialState: ->
      goldenwords: @props.data
    getDefaultProps: ->
      goldenwords: []

    addWord: (word) ->
      goldenwords = @state.goldenwords.slice()
      goldenwords.push word
      @setState goldenwords: goldenwords
    
    deleteWord: (word) ->
      goldenwords = @state.goldenwords.slice()
      index = goldenwords.indexOf word
      goldenwords.splice index, 1
      @replaceState goldenwords: goldenwords

    render: ->
      React.DOM.div
        className: 'goldenwords col-md-8 col-md-offset-2'
        React.DOM.h2
          className: 'title'
          'Goldenwords Admin'

        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Text'
              React.DOM.th null, 'Sheet Colour'
              React.DOM.th null, 'Correct'
              React.DOM.th null, 'Wrong'
              React.DOM.th null, 'Actions'

          React.DOM.tbody null,
            for goldenword in @state.goldenwords
              React.createElement Goldenword, key: goldenword.id, goldenword: goldenword, handleDeleteWord: @deleteWord
        React.DOM.hr null
        React.createElement GoldenwordForm, handleNewWord: @addWord
