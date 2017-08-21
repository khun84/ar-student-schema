require_relative '../../db/config'

class Subject < ActiveRecord::Base
  validates :teacher_id, uniqueness:{scope: :student_id}

  belongs_to :student
  belongs_to :teacher
end
