require 'customer_type/base'
require 'customer_type/cinema_citizen_class'

module CustomerType
  General = Base.new(:general)
  CinemaCitizen = CinemaCitizenClass.new(:cinema_citizen)
  CinemaCitizenOver60 = Base.new(:cinema_citizen_over60)
  Senior = Base.new(:senior)
  Student = Base.new(:student)
  HighAndJuniorHighSchoolStudent = Base.new(:high_and_junior_high_school_student)
end
