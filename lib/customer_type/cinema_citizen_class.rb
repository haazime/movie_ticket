module CustomerType
  class CinemaCitizenClass < Base

    def day_type(screening_at)
      return DayType::Weekday if screening_at.day_of_cinema? && screening_at.weekday?
      screening_at.to_day_type
    end
  end
end
