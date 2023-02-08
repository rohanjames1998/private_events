class AddMoreColumnsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :title, :string
    add_column :events, :desc, :text
    add_column :events, :country, :string
    add_column :events, :city, :string
    add_column :events, :starting_time, :time
    add_column :events, :ending_time, :time
  end
end
