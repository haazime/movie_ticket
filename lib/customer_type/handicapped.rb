module CustomerType
  module Handicapped
    class OverStudent
      def discount(screening_at)
        Discount.new(800)
      end
    end

    class UnderHighSchool
    end
  end
end
