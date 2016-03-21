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

  after_create :send_absent_notification!
  after_destroy :send_present_notification!

private
  def send_absent_notification!
    puts "------------- Send Absent notification SMS to #{self.student.phone} --------------------"
  end

  def send_present_notification!
    puts "------------- Send Present notification SMS to #{self.student.phone} -------------------"
  end
end
