@GoldenwordForm = React.createClass
    getInitialState: ->
      text: '',
      bg_colour: 'Red',
    
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value

    handleSubmit: (e) ->
      e.preventDefault()
      $.ajax
        method: 'POST'
        url: "/goldenwords"
        dataType: 'JSON'
        data:
          goldenword:
            text: @state.text
            bg_colour: @state.bg_colour
        success: (data) =>
          @props.handleNewWord data
          @setState @getInitialState()


    valid: ->
      @state.text

    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'New word'
            name: 'text'
            value: @state.text
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.select
            className: 'form-control selectpicker'
            value: 'Red'
            name: 'bg_colour'
            onChange: @handleChange
            React.DOM.option
              key: 'gold' 
              value: 'Golden'
              'Golden'
            React.DOM.option
              key: 'red' 
              value: 'Red'
              'Red'

        React.DOM.div
          className: 'form-group'
          React.DOM.button
            type: 'submit'
            className: 'btn btn-primary'
            disabled: !@valid()
            'Add word'
