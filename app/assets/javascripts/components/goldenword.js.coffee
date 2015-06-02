@Goldenword = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.goldenword.text
        React.DOM.td null, @props.goldenword.correct
        React.DOM.td null, @props.goldenword.wrong