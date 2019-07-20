module CustomerType
  class HightAndJuniorHighSchoolStudent
    def discount(screening_at)
      Discount.new(800)
    end
  end
end
