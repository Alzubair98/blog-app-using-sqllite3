require 'test_helper'

class CategoryTest <  ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "Sports")
    end

    test "category should be valid" do 
        assert @category.valid?
    end

    test "name should be present" do 
        @category.name= ""
        assert_not @category.valid?
    end

    test "name should be unique" do 
        @category.save
        @test = Category.new(name: "Sports")
        assert_not @test.valid?
    end

    test "name should not be too long" do
        @category.name= "IT" *26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name= "IT"
        assert_not @category.valid?
    end
end