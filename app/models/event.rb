class Event < ApplicationRecord
  belongs_to :recurring_event, optional:true
  belongs_to :turma
  belongs_to :discipline

  # scope :future, -> { where('start_date > ?', DateTime.now) }

  validates :start_date, :end_date, presence:true
  validates :title, presence: false

  attr_accessor :date_range
  attr_accessor :atualizar_todos
  attr_accessor :atualizar_proximos

  def all_day_event?
    self.start_date == self.start_date.midnight && self.end_date == self.end_date.midnight ? true : false
  end

  def start_time
    self.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
