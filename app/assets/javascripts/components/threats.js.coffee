@Threats = React.createClass
  getInitialState: ->
    threats: @props.threats

  handleFilter30: (e) ->
    e.preventDefault()
    that = this
    $.ajax '/threats/filter?date_filter=30',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  handleFilter60: (e) ->
    e.preventDefault()
    that = this
    $.ajax '/threats/filter?date_filter=60',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  handleFilter60: (e) ->
    e.preventDefault()
    that = this
    $.ajax '/threats/filter?date_filter=90',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  handleFiltered: (threats) ->
    @replaceState threats: threats

  render: ->
    React.DOM.div
      className: 'threats'
      React.createElement FilterForm, handleApplyFilters: @handleFiltered
      React.DOM.h2
        className: 'title'
        'Threats'
      React.DOM.table
        className: 'table table-bordered table-striped'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null,
              'Date'
            React.DOM.th null, 'All total'
            React.DOM.th null, 'All uniques'
            React.DOM.th null, 'IPs total'
            React.DOM.th null, 'IPs uniques'
            React.DOM.th null, 'Files total'
            React.DOM.th null, 'Files uniques'
            React.DOM.th null, 'Domains total'
            React.DOM.th null, 'Domains uniques'
            React.DOM.th null, 'URLs total'
            React.DOM.th null, 'URLs uniques'
        React.DOM.tbody null,
          for threat in @state.threats
            React.createElement Threat, key: threat.id, threat: threat
