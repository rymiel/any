require "spec"
require "../src/any"

describe Any do
  it "stores and retrieves simple values" do
    erased_int = Any.new 5
    restored_int = erased_int.value(Int32)
    restored_int.should eq 5

    erased_string = Any.new "Hello!"
    restored_string = erased_string.value(String)
    restored_string.should eq "Hello!"
  end

  it "stores and retrieves class instances" do
    array = [1, 2, 3]
    erased = Any.new array
    restored = erased.value(Array(Int32))
    restored.should eq array
    restored.should be array
  end

  it "gives the stored type name for inspection" do
    erased = Any.new({1, "!!"})
    erased.stored_type_name.should eq "Tuple(Int32, String)"
  end

  it "raises when types conflict" do
    erased = Any.new(1)
    expect_raises(TypeCastError, "This Any is holding an instance of Int32, not String") do
      erased.value(String)
    end
  end

  it "returns null when types conflict using value?" do
    erased = Any.new(1)
    restored = erased.value?(String)
    restored.should be_nil
    restored_correct = erased.value?(Int32)
    restored_correct.should eq 1
  end

  it "returns subclasses" do
    io_1 = IO::Memory.new "memory!"
    io_2 = STDIN
    erased_1 = Any.new io_1
    erased_2 = Any.new io_2
    restored_1 = erased_1.value(IO)
    restored_2 = erased_2.value(IO)
    restored_1.should be io_1
    restored_2.should be io_2
  end
end
