require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  validates :email, uniqueness: true

  # DEFINE ASSOCIATION
  has_many :student_teachers, foreign_key: :teacher_id, dependent: :destroy
  has_many :students, through: :student_teachers
end
