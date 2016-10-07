@Threats = React.createClass
  getInitialState: ->
    threats: @props.threats

  handleFilter30: (e) ->
    e.preventDefault()
    that = this
    $.ajax '?date_filter=30',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  handleFilter60: (e) ->
    e.preventDefault()
    that = this
    $.ajax '?date_filter=60',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  handleFilter60: (e) ->
    e.preventDefault()
    that = this
    $.ajax '?date_filter=90',
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.replaceState threats: data

  render: ->
    React.DOM.div
      className: 'threats'
      React.DOM.h2
        className: 'title'
        'Threats'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null,
              'Date'
              React.DOM.a
                href: '#'
                onClick: @handleFilter30
                React.DOM.span
                  className: 'label label-default'
                  '30'
              React.DOM.a
                href: '#'
                onClick: @handleFilter60
                React.DOM.span
                  className: 'label label-warning'
                  '60'
              React.DOM.a
                href: '#'
                onClick: @handleFilter90
                React.DOM.span
                  className: 'label label-danger'
                  '90'
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
