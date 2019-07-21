class CustomerType < Struct.new(:value)
  General = new(:general)
  CinemaCitizen = new(:cinema_citizen)

  def day_type(screening_at)
    if cinema_citizen?
      day_type_for_cinema_citizen(screening_at)
    else
      screening_at.to_day_type
    end
  end

  def cinema_citizen?
    value == :cinema_citizen
  end

  private

    def day_type_for_cinema_citizen(screening_at)
      if screening_at.day_of_cinema?
        if screening_at.holiday?
          DayType::DayOfCinema
        else
          DayType::Weekday
        end
      else
        screening_at.to_day_type
      end
    end
end
