module StudentsHelper
  def student_house_label_class(student)
    house_name = student.house.name
    class_names = {
      "Yellow" => "warning",
      "Red" => "danger",
      "Blue" => "primary",
      "Green" => "success",
    }

    return class_names[house_name]
  end
end
