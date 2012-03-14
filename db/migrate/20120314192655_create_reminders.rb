class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :content
      t.datetime :due_to

      t.timestamps
    end
  end
end
