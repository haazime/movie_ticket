require 'time'

class ScreeningAt
  class << self
    def parse(string)
      datetime = Time.parse(string)
      new(datetime.to_date, datetime.hour)
    end
  end

  def initialize(date, hour)
    @date = date
    @time = hour
  end

  def day_type(customer_type)
    if customer_type == CustomerType::CinemaCitizen
      if day_of_cinema?
        if holiday?
          DayType::DayOfCinema
        else
          DayType::Weekday
        end
      else
        return DayType::Holiday if holiday?
        DayType::Weekday
      end
    else
      return DayType::DayOfCinema if day_of_cinema?
      return DayType::Holiday if holiday?
      DayType::Weekday
    end
  end

  def show_type
    return nil if day_of_cinema?
    return ShowType::Late if late?
    ShowType::Normal
  end

  private

    def day_of_cinema?
      @date.day == 1
    end

    def holiday?
      [6, 7].include?(@date.cwday)
    end

    def late?
      @time >= 20
    end
end
