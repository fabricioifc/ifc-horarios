class AddRecuringEventToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :recurring_event, foreign_key: true
  end
end
