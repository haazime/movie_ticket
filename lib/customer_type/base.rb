module CustomerType
  class Base < Struct.new(:value)

    def day_type(screening_at)
      screening_at.to_day_type
    end
  end
end
