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
      create_new_event(date, url)
      $('#calendar').fullCalendar("refetchEvents");

    eventRender: (event, element) ->
      element.attr('href', 'javascript:void(0);');

    eventClick: ( event, jsEvent, view ) ->
      url = '/events/' +  event.id + '/edit'
      edit_event(url);

    eventResize: ( event, delta, revertFunc ) ->
      update_event(event)

    eventDrop: ( event, delta, revertFunc, jsEvent, ui, view ) ->
      update_event(event)

    eventAfterRender: (event, element, view) ->
      element.find(".fc-content")
            .append("<br><b>" + event.description + "</b>")
            .append("<br><b>" + event.info + "</b>");
  });

  $('#calendar').fullCalendar('render');

  edit_event = (url) ->
    $.ajax {
      url: url,
      dataType: 'script',
      complete: ->
        console.log("edit")
    }

  update_event = (event) ->
    start = event.start.format('YYYY-MM-DD')
    end = start
    if event.end != null
      end = event.end.format('YYYY-MM-DD')
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
      complete: ->
        console.log('event is updated')
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
      complete: ->
        console.log('created event')
    }

  $('body').on 'click', '.submit-edited-btn', (e) ->
    event = $('form').serialize();
    $.ajax {
      url: $('form').attr('action'),
      method: 'PUT',
      data: event,
      complete: ->
        console.log('event is updated')
    }
    $('#calendar').fullCalendar( 'refetchEvents' );
    e.preventDefault()
