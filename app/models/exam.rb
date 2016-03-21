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
end
