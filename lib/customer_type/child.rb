module CustomerType
  class Child
    def discount(screening_at)
      Discount.new(800)
    end
  end
end
