@Goldenword = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/goldenwords/#{ @props.goldenword.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteWord @props.goldenword
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.goldenword.text
      React.DOM.td null, @props.goldenword.correct
      React.DOM.td null, @props.goldenword.wrong
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
