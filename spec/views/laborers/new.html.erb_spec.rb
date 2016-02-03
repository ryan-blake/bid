require 'rails_helper'

RSpec.describe "laborers/new", type: :view do
  before(:each) do
    assign(:laborer, Laborer.new())
  end

  it "renders new laborer form" do
    render

    assert_select "form[action=?][method=?]", laborers_path, "post" do
    end
  end
end
