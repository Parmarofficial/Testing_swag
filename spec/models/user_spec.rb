require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a new model" do
    my_model = User.create(name: "demo",email: "Test@yopmail.com")
    expect(my_model).to be_valid
  end

  
end