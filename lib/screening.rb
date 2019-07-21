class Screening

  def initialize(screening_at, sound_type)
    @screening_at = screening_at
    @sound_type = sound_type
  end

  def day_type(customer_type)
    customer_type.day_type(@screening_at)
  end

  def show_type(customer_type)
    if [CustomerType::MICard, CustomerType::Park80].include?(customer_type)
      show_type_with_explosion
    else
      return nil if @screening_at.day_of_cinema?
      show_type_with_explosion
    end
  end

  private

    def show_type_with_explosion
      return ShowType::Normal if @sound_type.explosion?
      @screening_at.to_show_type
    end
end
