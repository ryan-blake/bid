require 'rails_helper'

RSpec.describe "laborers/edit", type: :view do
  before(:each) do
    @laborer = assign(:laborer, Laborer.create!())
  end

  it "renders the edit laborer form" do
    render

    assert_select "form[action=?][method=?]", laborer_path(@laborer), "post" do
    end
  end
end
