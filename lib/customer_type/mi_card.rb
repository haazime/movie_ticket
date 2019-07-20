module CustomerType
  class MICard
    def discount(screening_at)
      return Discount.none if screening_at.day_of_cinema?

      if screening_at.late?
        Discount.new(500)
      else
        Discount.new(200)
      end
    end
  end
end
