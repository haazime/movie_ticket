module FeeRule
  class << self

    def determine(customer_type, screening)
      Fee.new(
        customer_type,
        screening.day_type(customer_type),
        screening.show_type(customer_type)
      )
    end
  end
end
