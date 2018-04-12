class AdDExtraDateToRecurringEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :recurring_events, :extra_date, :date
  end
end
