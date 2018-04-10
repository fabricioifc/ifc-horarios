class AddDatasToEventosRecorrentes < ActiveRecord::Migration[5.1]
  def change
    add_column :recurring_events, :start_date, :datetime
    add_column :recurring_events, :end_date, :datetime
  end
end
