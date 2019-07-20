module CustomerType
  class Student
    def discount(screening_at)
      if screening_at.day_of_cinema?
        discount_by_day_of_cinema
      else
        discount_by_not_day_of_cinema(screening_at)
      end
    end

    private

      def discount_by_day_of_cinema
        Discount.new(700)
      end

      def discount_by_not_day_of_cinema(screening_at)
        if screening_at.late?
          Discount.new(500)
        else
          Discount.new(300)
        end
      end
  end
end
