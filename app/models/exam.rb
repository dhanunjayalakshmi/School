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

  def stats(subject_name)
    @stats ||= {}
    return @stats[subject_name] if @stats[subject_name]
    my_score = self.send(subject_name)

    students = self.student.section.students.includes(:exam)
    scores =students.collect { |st| st.exam.send(subject_name) }

    high = scores.max
    average = scores.reduce(:+)/students.count

    less = scores.count { |score| score <= my_score }
    percentile = 100*less/students.count
    rank = students.count - less + 1

    @stats[subject_name] = {high: high, average: average, percentile: percentile, rank: rank}

    return @stats[subject_name]
  end
end
