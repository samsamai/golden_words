@Goldenwords = React.createClass
    getInitialState: ->
      goldenwords: @props.data
    getDefaultProps: ->
      goldenwords: []

    render: ->
      React.DOM.div
        className: 'goldenwords'
        React.DOM.h2
          className: 'title'
          'Goldenwords Title here'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Text'
              React.DOM.th null, 'Correct'
              React.DOM.th null, 'Wrong'
          React.DOM.tbody null,
            for goldenword in @state.goldenwords
              React.createElement Goldenword, key: goldenword.id, goldenword: goldenword
