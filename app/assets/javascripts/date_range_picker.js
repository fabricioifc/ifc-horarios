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
        timePicker24Hour: true
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('DD/MM/YYYY HH:mm'));
      $('.end_hidden').val(end.format('DD/MM/YYYY HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);
