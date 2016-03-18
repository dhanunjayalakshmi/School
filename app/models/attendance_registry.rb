class AttendanceRegistry < ActiveRecord::Base
  belongs_to :section

  attr_accessor :absentees_ids
end
