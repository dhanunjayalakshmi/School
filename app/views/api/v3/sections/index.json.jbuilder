json.array! @sections do |section|
  json.id section.id
  json.name section.name
  json.students do
    json.array! section.students, :id, :roll_number, :name
  end
end
