json.students @students do |student|
  json.klass_id student.section.klass_id
  json.section_id student.section_id
  json.id student.id
  json.roll_number student.roll_number
  json.name student.name
  json.fathers_name student.fathers_name
  json.gender Student::Gender.label(student.gender)
  json.dob student.dob
  json.email student.email
  json.phone student.phone
  json.address student.address
  json.house_name student.house.name
end
