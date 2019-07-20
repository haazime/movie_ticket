require 'time'

class ScreeningAt
  class << self
    def parse(string)
      datetime = Time.parse(string)
      date = datetime.to_date
      hour = datetime.hour
      new(date, hour)
    end
  end

  def initialize(date, hour)
    @date = date
    @time = hour
  end

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
