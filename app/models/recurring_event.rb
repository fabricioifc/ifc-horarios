class RecurringEvent < ApplicationRecord
  enum frequency: { semanalmente: 0, mensalmente: 1, anualmente: 2 }

  validates :anchor, presence: true
  validates :frequency, presence: true
  validates :title, presence: true

  def schedule
    @schedule ||= begin
      schedule = IceCube::Schedule.new(now = anchor)
      case frequency
      when 'semanalmente'
        schedule.add_recurrence_rule IceCube::Rule.weekly(1)
      when 'mensalmente'
        schedule.add_recurrence_rule IceCube::Rule.monthly(1)
      when 'anualmente'
        schedule.add_recurrence_rule IceCube::Rule.yearly(1)
      end
      schedule
    end
  end

  def events(start_date, end_date)
    start_frequency = start_date ? start_date.to_date : Date.today - 1.year
    end_frequency = end_date ? end_date.to_date : Date.today + 1.year
    schedule.occurrences_between(start_frequency, end_frequency)
  end

end
