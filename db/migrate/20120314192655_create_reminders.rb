class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :content
      t.date :due_to
      t.time :due_time

      t.timestamps
    end
  end
end
