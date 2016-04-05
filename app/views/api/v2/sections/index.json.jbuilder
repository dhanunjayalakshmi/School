json.array! @sections do |section|
  json.id section.id
  json.name section.name
  json.student_ids section.student_ids
  json.students do
    json.array! section.students, :id, :roll_number, :name
  end
end
