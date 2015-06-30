@Goldenword = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/goldenwords/#{ @props.goldenword.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteWord @props.goldenword

  componentDidMount: () ->
    $("[name='gw_bg_colour_#{@props.goldenword.id}'").editable({
        type: 'select',
        title: 'Select status',
        value: @props.goldenword.bg_colour,
        source: [
            {value: 'Golden', text: 'Golden'},
            {value: 'Red', text: 'Red'}
        ],
        mode: 'inline',
        showbuttons: false,
        pk: @props.goldenword.id,
        url: "/goldenwords/#{ @props.goldenword.id }",
        params: (params) ->
          params = 
            goldenword:
              bg_colour: params.value
          return params
        ajaxOptions: {
                type: 'put',
            }      
    });

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.goldenword.text
      React.DOM.td null,
        React.DOM.a
          className: 'editable editable-click'
          id: "bg_colour"
          name: "gw_bg_colour_#{@props.goldenword.id}"
          @props.goldenword.bg_colour
      React.DOM.td null, @props.goldenword.correct
      React.DOM.td null, @props.goldenword.wrong
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
        React.DOM.a
          className: 'btn btn-danger'
          href: "/goldenwords/#{ @props.goldenword.id }/edit"
          'Edit'
