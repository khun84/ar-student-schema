require_relative '../../db/config'

# THIS IS JUST ANOTHER METHOD TO DO CUSTOM VALIDATION
# IT HAS TO BE DEFINED BEFORE THE MODEL OBJECT
# class AgeValidator < ActiveModel::Validator
#   def validate(record)
#     unless (Date.today.year - record.birthday.year) > 5
#       record.errors[:birthday] << 'Age has to be bigger than 5'
#     end
#   end
# end

class Student < ActiveRecord::Base
  # VALIDATION
  validates :email, uniqueness: true,
                     presence: true,
                     format: {with: /\@\w{2,}\./, message: "wrong email format"}
  validates :age, presence: true, numericality: {greater_than: 5, message: "Age must be greater than 5"}
  validates :phone, format: {with:/\(?\d{3}\)?[ -]\d{3}[ -]\d{4}( x\d{4})?/, message: "Check your phone format"}
  validates :gender, inclusion:{in: %w(male female), message:"Gender must be either male or female"}
  # validates_with AgeValidator

  #DEFINE ASSOCIATION
  has_many :subjects, foreign_key: :student_id, dependent: :destroy
  has_many :teachers, through: :subjects

# implement your Student model here
  def name
    return self.first_name + ' ' + self.last_name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
    return age
  end

end


