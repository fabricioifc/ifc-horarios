var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        locale: {
          format: 'DD/MM/YYYY HH:mm'
        },
        timePicker: true,
        timePickerIncrement: 15,
        alwaysShowCalendars: true,
        timePicker24Hour: true,
        minTime: "07:45",
        maxTime: "16:15"
    }, function(start, end, label) {
      console.log(start);
      $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);

var time_range_picker;
time_range_picker = function() {
  $('.time-range-picker').each(function(){
    $(this).daterangepicker({
        locale: {
          format: 'HH:mm'
        },
        timePicker: true,
        timePickerIncrement: 15,
        alwaysShowCalendars: true,
        timePicker24Hour: true
    }, function(start, end, label) {
      console.log(start);
      $('.start_hidden').val(moment(start).format('HH:mm'));
      $('.end_hidden').val(moment(end).format('HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', time_range_picker);
