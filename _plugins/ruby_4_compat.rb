# frozen_string_literal: true

# Liquid 4 still calls Ruby's obsolete object-tainting API. Ruby 4 removed
# these no-op methods, so provide them only when the runtime no longer does.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)

  def taint
    self
  end unless method_defined?(:taint)

  def untaint
    self
  end unless method_defined?(:untaint)
end
