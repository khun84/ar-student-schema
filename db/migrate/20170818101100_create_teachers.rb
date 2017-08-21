require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :teachers do |t|

      # add columns that you would need for this table
      t.string :name
      t.string :email, unique:true
      t.string :phone
      t.timestamps
    end
  end
end
