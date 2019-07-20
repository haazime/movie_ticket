module CustomerType
  class Park80
    def discount(screening_at)
      return Discount.none if screening_at.day_of_cinema?

      if screening_at.late?
        Discount.new(700)
      else
        Discount.new(400)
      end
    end
  end
end
