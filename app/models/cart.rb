class Cart
  attr_reader :cart_contents

  def initialize(cart_contents)
    @cart_contents = cart_contents || {}
  end

  def total_count
    cart_contents.values.sum
  end

  def add_movie(id)
    cart_contents[id.to_s] = (cart_contents[id.to_s] || 0) + 1
  end

  def count_of(id)
    cart_contents[id.to_s]
  end
end
