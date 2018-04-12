class DateRangeValidator < ActiveModel::EachValidator

  ALLOWTIMES = ['07:45','08:30','09:15','10:00','10:15','11:00','11:45','13:00','13:45','14:30','15:15','15:30','16:15', '17:00'];

  def validate_each(record, attribute, value)
    time = value.strftime('%H:%M')

    if !ALLOWTIMES.include?(time)
      record.errors.add(attribute, "#{time} não é um horário válido")
    end
  end

end
