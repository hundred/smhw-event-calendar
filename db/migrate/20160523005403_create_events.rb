class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.text :info
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
