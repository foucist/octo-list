class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :entry
      t.boolean :done
      t.boolean :sticky

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
