require_relative '../app/models/subject'
require_relative '../app/models/student'
require_relative '../app/models/teacher'

module SubjectsImporter
  def self.import
    student_k = Student.where("substr(first_name,1,1) = 'K'")
    student_k.each do |record|
      Subject.create(student_id:record.id, teacher_id:1)
    end

    student_l = Student.where("substr(first_name,1,1) = 'L'")
    student_l.each do |record|
      Subject.create(student_id:record.id, teacher_id:2)
    end


  end
end

student1 = Student.first
p student1.teachers.length