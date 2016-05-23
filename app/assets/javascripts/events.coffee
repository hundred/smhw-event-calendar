jQuery ->

  $('#calendar').fullCalendar({
    allDay: true,
    defaultView: 'basicWeek',
    events: 'api/events/list_events.json',

    dayClick: ->
      url = '/api/events'
      date = $(this).data('date')
      console.log(date)
      create_new_event(date, url)
      $('#calendar').fullCalendar("refetchEvents");

    eventAfterRender: (event, element, view) ->
      element.find(".fc-content")
            .append("<br><b>Description</b>:" + event.description)
            .append("<br><b>Info</b>:" + event.info);
  });

  $('#calendar').fullCalendar('render');

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
