jQuery ->

  $('#calendar').fullCalendar({
    allDay: true,
    defaultView: 'basicWeek',
    events: 'api/events/list_events.json',
    editable: true,
    resizable: true,

    dayClick: ->
      url = '/api/events'
      date = $(this).data('date')
      console.log(date)
      create_new_event(date, url)
      $('#calendar').fullCalendar("refetchEvents");

    eventResize: ( event, delta, revertFunc ) ->
      start = event.start.format('YYYY-MM-DD')
      end = start
      if event.end != null
        end = event.end.format('YYYY-MM-DD')

      console.log("done eventResizeStop" + " " + start + " " + end)
      update_event(event, start, end)

    eventAfterRender: (event, element, view) ->
      element.find(".fc-content")
            .append("<br><b>Description</b>:" + event.description)
            .append("<br><b>Info</b>:" + event.info);
  });

  $('#calendar').fullCalendar('render');

  update_event = (event, start, end) ->
    $.ajax {
      url: '/api/events/'+event.id,
      method: 'PUT',
      data: { event: {
              title: event.title,
              description: event.description,
              info: event.info,
              start_time: start,
              end_time: end
              }
            }
      success: ->
        console.log('event is now updated')
  }


  create_new_event = (date, url) ->
    $.ajax {
      url: url,
      method: 'POST',
      data: { event: {
                title: 'New event',
                description: '...',
                info: '...',
                start_time: date,
                end_time: date
              }
            },
      success: ->
        console.log('created event')
    }
