@Threat = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.threat.date
      React.DOM.td null, @props.threat.all_total
      React.DOM.td null, @props.threat.all_uniques
      React.DOM.td null, @props.threat.ips_total
      React.DOM.td null, @props.threat.ips_uniques
      React.DOM.td null, @props.threat.files_total
      React.DOM.td null, @props.threat.files_uniques
      React.DOM.td null, @props.threat.domains_total
      React.DOM.td null, @props.threat.domains_uniques
      React.DOM.td null, @props.threat.urls_total
      React.DOM.td null, @props.threat.urls_uniques
