require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudentTeachers < ActiveRecord::Migration[5.1]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :student_teachers do |t|

      # add columns that you would need for this table
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
