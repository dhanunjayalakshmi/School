json.sections @sections do |section|
  json.klass_id section.klass_id
  json.id section.id
  json.name section.name
  json.student_ids section.student_ids
end
