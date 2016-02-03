require 'rails_helper'

RSpec.describe "laborers/index", type: :view do
  before(:each) do
    assign(:laborers, [
      Laborer.create!(),
      Laborer.create!()
    ])
  end

  it "renders a list of laborers" do
    render
  end
end
