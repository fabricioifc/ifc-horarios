class RecurringEvent < ApplicationRecord
  enum frequency: { semanalmente: 0, mensalmente: 1, anualmente: 2 }
  has_many :events, dependent: :destroy

  validates :anchor, presence: false
  validates :frequency, presence: true
  validates :title, presence: true
  attr_accessor :date_range

  TIME_12H_FORMAT = /\A(1[0-2]|0?[1-9]):[0-5][0-9]\s?(am|pm)\z/i

  # validates :time, presence: true,
  #   format: { with: TIME_12H_FORMAT, message: 'invalid time - use format 10:00 am' }

  # validates_time :start_date, :between => ['07:45am', '16:15am']
  # validates_time :end_date, :between => ['08:15am', '17:00am']

  def all_day_event?
    self.start_date == self.start_date.midnight && self.end_date == self.end_date.midnight ? true : false
  end

  def schedule
    @schedule ||= begin
      schedule = IceCube::Schedule.new(now = self.start_date.to_date)
      # schedule = IceCube::Schedule.new(start = start_date, :end_time => end_date)
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

  def schedule_events(start_date, end_date)
    start_frequency = start_date ? start_date.to_date : Date.today - 1.year
    end_frequency = end_date ? end_date.to_date : Date.today + 1.year
    schedule.occurrences_between(start_frequency, end_frequency)
  end

  def schedule_recurring_events
    schedule.occurrences_between(start_date.to_date, end_date.to_date)
  end

  def start_time
    self.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

end
