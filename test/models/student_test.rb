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

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
