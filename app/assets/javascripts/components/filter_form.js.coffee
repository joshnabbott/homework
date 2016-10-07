@FilterForm = React.createClass
  getInitialState: ->
    date_filter: ''
    averages_filter: {
      'all_total': 'false',
      'all_uniques': 'false',
      'ips_total': 'false',
      'ips_uniques': 'false',
      'files_total': 'false',
      'files_uniques': 'false',
      'domains_total': 'false',
      'domains_uniques': 'false',
      'urls_total': 'false',
      'urls_uniques': 'false',
    }

  handleCheckedChange: (e) ->
    name = e.target.name
    @setState "averages_filter[#{ name }]": e.target.checked

  handleValueChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    console.log @state
    e.preventDefault()
    that = this
    $.ajax '/threats/filter',
      data: @state
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.props.handleApplyFilters data

  resetFilters: (e) ->
    @replaceState @getInitialState()
    console.log @state
    console.log 'reset everything to blank'

  render: ->
    React.DOM.div
      className: 'jumbotron'
      React.DOM.h1
        'Filter records'
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'Last 30 days'
          React.DOM.input
            type: 'radio'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date_filter'
            value: '30'
            checked: @state.date_filter == '30'
            onChange: @handleValueChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'Last 60 days'
          React.DOM.input
            type: 'radio'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date_filter'
            value: '60'
            checked: @state.date_filter == '60'
            onChange: @handleValueChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'Last 90 days'
          React.DOM.input
            type: 'radio'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date_filter'
            value: '90'
            checked: @state.date_filter == '90'
            onChange: @handleValueChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'All total'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'all_total'
              onChange: @handleCheckedChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'All uniques'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'all_uniques'
              onChange: @handleCheckedChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'IPs total'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'ips_total'
              onChange: @handleCheckedChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'IPs uniques'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'ips_uniques'
              onChange: @handleCheckedChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'Files total'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'files_total'
              onChange: @handleCheckedChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label null, 'Files uniques'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control'
              name: 'files_uniques'
              onChange: @handleCheckedChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          'Filter records'
