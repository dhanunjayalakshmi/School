# == Schema Information
#
# Table name: exams
#
#  id          :integer          not null, primary key
#  student_id  :integer
#  english     :integer
#  hindi       :integer
#  mathematics :integer
#  science     :integer
#  social      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Exam < ActiveRecord::Base
  belongs_to :student

  attr_accessor :file

  def total
    self.english + self.hindi + self.mathematics + self.science + self.social
  end

  def high(subject_name)
    self.student.section.students.collect do |st|
      st.exam.send(subject_name)
    end.max
  end

  def avg(subject_name)
    arr = self.student.section.students.collect { |st|
      st.exam.send(subject_name)}
    avg = arr.inject{ |sum, el| sum + el }.to_f / arr.size
    avg = avg.round(2)
    # Exam.average(subject_name).where(:subject_name => self.student.section.student.exam.subject_name)
  end

  def percentile(subject_name)
    arr = self.student.section.students.collect { |st|
      st.exam.send(subject_name)}
    total_students = self.student.section.students.count - 1
    marks = self.send(subject_name)
    x = arr.count {|a| a < marks}
    percentile = ((x / total_students.to_f)*100).round(2)
  end
end
