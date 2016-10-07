@DateFilter = React.createClass
  handleFilter: (e) ->
    e.preventDefault()
    that = this
    $.ajax '/threats/filter?date_filter=' + @props.filter_num,
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.props.handleDateFilter data

  render: ->
    React.DOM.a
      href: '#'
      onClick: @handleFilter
      React.DOM.span
        className: 'label label-default'
        @props.name
