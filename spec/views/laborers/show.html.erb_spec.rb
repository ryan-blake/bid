require 'rails_helper'

RSpec.describe "laborers/show", type: :view do
  before(:each) do
    @laborer = assign(:laborer, Laborer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
