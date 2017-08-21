require_relative '../config'

# this is where you should use an ActiveRecord migration to

class ChangeTableName < ActiveRecord::Migration[5.1]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    rename_table :student_teachers, :subjects
  end
end
