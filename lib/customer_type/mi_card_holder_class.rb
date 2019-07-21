module CustomerType
  class MICardClass < Base

    def day_type(screening_at)
      if screening_at.day_of_cinema?
        return DayType::Holiday if screening_at.holiday?
        DayType::Weekday
      else
        screening_at.to_day_type
      end
    end
  end
end
