class Event < ApplicationRecord
  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start_date == self.start_date.midnight && self.end_date == self.end_date.midnight ? true : false
  end
end
