# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  section_id   :integer
#  house_id     :integer
#  roll_number  :integer
#  name         :string
#  fathers_name :string
#  gender       :string
#  email        :string
#  dob          :date
#  phone        :string
#  address      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Student < ActiveRecord::Base
  module Gender
    MALE = 1
    FEMALE = 2

    def self.all
      [MALE, FEMALE]
    end
  end

  belongs_to :section
  belongs_to :house
end
