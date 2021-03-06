defmodule StructFieldsTest do
  use ExUnit.Case
  doctest StructFields

  test "fields" do
    defmodule MyStruct do
      use StructFields

      defstruct [:foo, :bar]
    end

    assert MyStruct.fields == [:bar, :foo]
  end

  test "ignore option" do
    defmodule MyModuleIgnoreFields do
      use StructFields, ignore: [:foo]

      defstruct [:foo, :bar, :baz]
    end

    assert MyModuleIgnoreFields.fields == [:bar, :baz]
  end
end
