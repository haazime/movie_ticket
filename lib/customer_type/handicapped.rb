module CustomerType
  module Handicapped
    class OverStudent
      def discount(screening_at)
        Discount.new(800)
      end
    end

    class UnderHighSchoolStudent
      def discount(screening_at)
        Discount.new(900)
      end
    end
  end
end
