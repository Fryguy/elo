class window.RankChartView

  constructor: (options)->
    @dates = _.map(options.collection, (item)=> @formatDate(item.date))
    @singlesData = _.filter(options.collection, (item)-> item.rank)
    @doublesData = _.filter(options.collection, (item)-> item.doubles_rank)
    @ignoreSingles = options.ignoreSingles
    @ignoreDoubles = options.ignoreDoubles

    @chart = new Highcharts.Chart
      chart:
        renderTo: options.el
        type: 'line'
      title:
        text: "Rank Over Time"
      xAxis:
        categories: @dates
        labels:
          step: 25
      yAxis:
        title:
          text: 'ELO'
      series: [@singlesSeries(), @doublesSeries()].filter((x) -> x != null)

  formatDate: (dateStr)->
    Date.parse(dateStr).toString("d MMM h:mm")

  singlesSeries: ->
    if @ignoreSingles
      null
    else
      name: 'Individual Rank'
      data: _.map(@singlesData, (item)=> @point(item))

  doublesSeries: ->
    if @ignoreDoubles
      null
    else
      name: 'Doubles Rank'
      data: _.map(@doublesData, (item)=> @point(item))

  point: (item)->
    name: "#{item.winner_names} beat #{item.loser_names} by #{item.margin} (Δ#{item.change})"
    x: _.indexOf(@dates, @formatDate(item.date))
    y: item.rank || item.doubles_rank
