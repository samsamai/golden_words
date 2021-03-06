@Test = React.createClass
    getInitialState: ->
      goldenwords: @props.data
      current_goldenword: @props.data[0]
      
    getDefaultProps: ->
      goldenwords: []
      colour_table: { 
          "Red": "#FF0000", 
          "Golden": "#FFE800", 
          "Blue": "#00AAFF",
          "Green": "#3FB33F" 
      }

    getRandomWord: (currentWord) ->
      _this = @
      random_index = Math.floor(Math.random() * (@state.goldenwords.length))
      result = @state.goldenwords[random_index]
      if result == @state.current_goldenword
        result = _this.getRandomWord( currentWord )
      return result

    showAnotherWord: () ->
      _this = @
      @setState( {current_goldenword: _this.getRandomWord( _this.state.currentWord )} )

    updateDB: () ->
      _this = @
      $.ajax
        method: 'PUT'
        url: "/goldenwords/#{ @state.current_goldenword.id }"
        dataType: 'JSON'
        data:
          goldenword:
            correct: @state.current_goldenword.correct
            wrong: @state.current_goldenword.wrong
        success: (data) =>
          @setState( {current_goldenword: @getRandomWord( @state.currentWord )} )

    handleCorrect: ->
      _this = @
      @state.current_goldenword.correct += 1
      _this.updateDB()

    handleWrong: ->
      _this = @
      @state.current_goldenword.wrong += 1
      _this.updateDB()

    render: ->
      React.DOM.div
        className: 'container'
        React.DOM.div
          React.DOM.h1
            id: 'title'
            style: { backgroundColor: @props.colour_table[@state.current_goldenword.bg_colour] }
            className: 'jumbotron text-center'
            'Goldenwords'
          React.DOM.div
            className: 'row col-sm-12 col-md-12 center-block'
            React.DOM.div
              className: 'goldenword'
              @state.current_goldenword.text
          React.DOM.div
            id: 'test-buttons'
            className: 'col-md-8 col-md-offset-2'
            React.DOM.a
              className: 'button btn btn-primary btn-lg col-md-4 pull-left'
              onClick: @handleCorrect
              'Correct'
            React.DOM.a
              className: 'button btn btn-primary btn-lg col-md-4 pull-right'
              onClick: @handleWrong
              'Wrong'
