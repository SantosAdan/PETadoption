require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  def test_should_not_save_user_without_name
        animal = Animal.new
        assert !animal.save
 end
end
