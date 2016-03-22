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

  def self.upload(rows)
    klass_name, section_name = rows[2].to_a
    klass = Klass.find_by(name: klass_name)
    section = klass.sections.find_by(name: section_name)
    (5...rows.count).each do |i|
      data = rows[i].to_a
      student = section.students.find_by(roll_number: data[0].to_i)
      exam = student.exam || student.create_exam
      # exam.english     = data[2].to_i
      # exam.hindi       = data[3].to_i
      # exam.mathematics = data[4].to_i
      # exam.science     = data[5].to_i
      # exam.social      = data[6].to_i
      j = 2
      [:english, :hindi, :mathematics, :science, :social].each do |subject|
        exam.send(subject, data[j].to_i)
        j += 1
      end
      exam.save!
    end
  end

  def total
    self.english + self.hindi + self.mathematics + self.science + self.social
  end

  def stats(subject_name)
    @stats ||= {}
    return @stats[subject_name] if @stats[subject_name]

    fetch_stats(subject_name)
    return @stats[subject_name]
  end

private
  def fetch_stats(subject_name)
    my_score = self.send(subject_name)

    students = self.student.section.students.includes(:exam)
    scores = get_scores(students, subject_name)

    high = scores.max
    average = scores.reduce(:+)/students.count

    less = scores.count { |score| score <= my_score }
    percentile = 100*less/students.count
    rank = students.count - less + 1

    @stats[subject_name] = {high: high, average: average, percentile: percentile, rank: rank}
  end

  def get_scores(students, subject_name)
    students.collect { |st| st.exam.send(subject_name) }
  end
end
