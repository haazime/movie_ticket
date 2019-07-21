class SoundType < Struct.new(:value)
  Normal = new(:normal)
  Explosion = new(:explosion)

  def explosion?
    value == :explosion
  end
end
