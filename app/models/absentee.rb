# == Schema Information
#
# Table name: absentees
#
#  id                     :integer          not null, primary key
#  student_id             :integer
#  attendance_registry_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Absentee < ActiveRecord::Base
  belongs_to :student
  belongs_to :attendance_registry
end
