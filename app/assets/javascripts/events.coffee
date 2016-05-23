jQuery ->

  $('#calendar').fullCalendar({
    allDay: true,
    defaultView: 'basicWeek',
    events: 'api/events/list_events.json',
  });

  $('#calendar').fullCalendar('render');
