require 'rails_helper'

RSpec.describe "welcomes/show", type: :view do
  before(:each) do
    @welcome = assign(:welcome, Welcome.create!(
      :index => "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
  end
end
