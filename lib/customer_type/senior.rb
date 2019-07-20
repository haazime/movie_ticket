module CustomerType
  class Senior
    def discount(screening_at)
      Discount.new(700)
    end
  end
end
