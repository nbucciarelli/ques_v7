class CreateQues < ActiveRecord::Migration
  def change
    create_table :ques do |t|
      # When you create this table, ID is AUTOMATICALLY created
      t.string :name
      t.timestamps
      # Creates a created_at, and updated_at inside of the table
      # When an object of Que type is created, created_at is set. This will only get set/changed once!
      # When an object of Que type is updated, updated_at is set. This will change EVERY TIME an object is changed
    end

  end
end
