class Screening

  def initialize(screening_at, sound_type)
    @screening_at = screening_at
    @sound_type = sound_type
  end

  def day_type(customer_type)
    @screening_at.day_type(customer_type)
  end

  def show_type
    return ShowType::Normal if @sound_type == SoundType::Explosion
    @screening_at.show_type
  end
end
