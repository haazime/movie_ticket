class Screening

  def initialize(screening_at, sound_type)
    @screening_at = screening_at
    @sound_type = sound_type
  end

  def day_type(customer_type)
    customer_type.day_type(@screening_at)
  end

  def show_type
    return ShowType::Normal if @sound_type.explosion?
    @screening_at.to_show_type
  end
end
