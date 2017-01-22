##
# require rspec to load !

require './classes_and_modules'

RSpec.describe "SimpleClass" do
  it "should exist" do
    expect(defined?(SimpleClass)).to be_truthy
  end

  it "should have a class method 'foo' which says 'foo'" do
    expect(SimpleClass).to respond_to(:foo)
    expect(SimpleClass.foo).to eq('foo')
  end

  it "should have a singleton_class method 'bar' which says 'bar'" do
    expect(SimpleClass.singleton_methods).to include(:bar)
    expect(SimpleClass.bar).to eq('bar')
  end

  context "i have an instance" do
    let(:instance) { SimpleClass.new }

    it "responds to 'foo' which says 'foo'" do
      expect(instance).to respond_to(:foo)
      expect(instance.foo).to eq('foo')
    end

    it "should have a method returning instance itself" do
      expect(instance.my_instance).to eq(instance)
    end
  end
end

RSpec.describe "InheritedClass" do
  it "should exist" do
    expect(defined?(InheritedClass)).to be_truthy
  end

  it "should have 'SimpleClass' as ancestor" do
    expect(InheritedClass.ancestors).to include(SimpleClass)
  end

  it "should now have 'SimpleClass' methods" do
    expect(InheritedClass.new).to respond_to(:foo)
    expect(InheritedClass).to respond_to(:foo)
    expect(InheritedClass.singleton_methods).to include(:bar)
  end
end

RSpec.describe "IncludedModule (TIP ActiveSupport::Concern does well)" do
  it "should exist" do
    expect(defined?(IncludedModule)).to be_truthy
  end

  context "the module is included in 'InheritedClass'" do
    before { InheritedClass.send(:include, IncludedModule) }

    it "should respond to 'from_included' as class method" do
      expect(InheritedClass).to respond_to(:from_included)
    end

    it "should respond to 'from_included' as instance method" do
      expect(InheritedClass.new).to respond_to(:from_included)
    end

    it "should return the super container class foo method with ' foo' added" do
      instance = InheritedClass.new
      expect(instance.foo).to eq('foo foo')
    end
  end
end

