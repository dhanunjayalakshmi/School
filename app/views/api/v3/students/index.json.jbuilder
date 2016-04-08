json.students @students do |student|
  json.id student.id
  json.roll_number student.roll_number
  json.name student.name
  json.fathers_name student.fathers_name
  json.gender student.gender
  json.dob student.dob
  json.email student.email
  json.phone student.phone
  json.address student.address
  json.house_id student.house_id
end
