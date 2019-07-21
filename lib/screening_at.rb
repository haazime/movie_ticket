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

  def to_day_type
    return DayType::DayOfCinema if day_of_cinema?
    to_day_type_ignore_cinema_of_day
  end

  def to_day_type_ignore_cinema_of_day
    return DayType::Holiday if holiday?
    DayType::Weekday
  end

  def day_of_cinema?
    @date.day == 1
  end

  def weekday?
    !holiday?
  end

  def holiday?
    [6, 7].include?(@date.cwday)
  end

  def late?
    @time >= 20
  end
end
