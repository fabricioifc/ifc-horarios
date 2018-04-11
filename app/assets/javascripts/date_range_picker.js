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

var datetimepicker;
datetimepicker = function() {
  allowTimesStart = ['07:45','08:30','09:15','10:15','11:00','13:00','13:45','14:30','15:30','16:15'];
  allowTimesEnd = ['08:30','09:15','10:00','11:00','13:45','14:30','15:30','16:15','17:00'];
  options = {
    inline: false,
    format:'d/m/Y H:i',
    lang:'pt-BR',
    weeks:true,
    dayOfWeekStart : 1,
    mask: '99/99/9999 99:99',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior',
  }

  $('.date-time-picker-start').each(function(){
    options.allowTimes = allowTimesStart
    $(this).datetimepicker(options);
  });

  $('.date-time-picker-end').each(function(){
    options.allowTimes = allowTimesEnd;
    $(this).datetimepicker(options);
  });
};

$(document).on('turbolinks:load', datetimepicker);
