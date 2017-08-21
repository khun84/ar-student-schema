require_relative '../config'
require_relative '../../app/models/student'

# this is where you should use an ActiveRecord migration to

class MergeName < ActiveRecord::Migration[5.1]
  def up
    add_column :students, :name, :string
    Student.all.each do |s|
      s.update(
          name: "#{s.first_name}_#{s.last_name}"
      )
    end
    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.all.each do |s|
      name_array = s.name.split('_')
      s.update(
          first_name:name_array[0],
          last_name: name_array[1]
      )
    end

    remove_column :students, :name

  end
end
