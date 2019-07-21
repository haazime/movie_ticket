module CustomerType
  class WithoutDayOfCinema < Base

    def day_type(screening_at)
      if screening_at.day_of_cinema?
        screening_at.to_day_type_ignore_cinema_of_day
      else
        screening_at.to_day_type
      end
    end
  end
end
