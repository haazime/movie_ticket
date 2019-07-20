class Discount < Struct.new(:amount)
  module None
  end

  class << self
    def none
      None
    end
  end
end
