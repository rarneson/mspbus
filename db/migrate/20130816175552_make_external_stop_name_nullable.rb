class MakeExternalStopNameNullable < ActiveRecord::Migration
  def up
    change_column :source_stops, :external_stop_name, :string, null: true
  end

  def down
    change_column :source_stops, :external_stop_name, :string, null: false
  end
end
