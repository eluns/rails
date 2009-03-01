require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "validates presence of name" do
    event = events(:one)
    event.name = nil
    assert ! event.valid?
    assert event.errors.on(:name)
  end
end
