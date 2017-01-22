require 'rubygems'
require 'active_support'

# your code goes there

class SimpleClass
  def foo
    'foo'
  end

  def my_instance
    self
  end

  def self.foo
    'foo'
  end

  class << self
    def bar
      'bar'
    end
  end
end

class InheritedClass < SimpleClass
end

module IncludedModule
  extend ActiveSupport::Concern

  def from_included
  end

  included do
    def foo
      super + ' foo'
    end
  end

  class_methods do
    def from_included
    end
  end
end
