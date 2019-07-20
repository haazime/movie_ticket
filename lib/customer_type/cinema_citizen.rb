module CustomerType
  module CinemaCitizen
    def self.detect_by_age(age)
      if age >= 60
        Over60.new
      else
        Under59.new
      end
    end

    class Over60

      def discount(screening_at)
        Discount.new(800)
      end
    end

    class Under59

      def discount(screening_at)
        if screening_at.holiday?
          discount_by_holiday(screening_at)
        else
          discount_by_weekday
        end
      end

      private

        def discount_by_weekday
          Discount.new(800)
        end

        def discount_by_holiday(screening_at)
          return Discount.new(700) if screening_at.day_of_cinema?
          if screening_at.late?
            Discount.new(800)
          else
            Discount.new(500)
          end
        end
    end
  end
end
