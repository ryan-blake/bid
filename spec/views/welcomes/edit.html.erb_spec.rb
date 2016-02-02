require 'rails_helper'

RSpec.describe "welcomes/edit", type: :view do
  before(:each) do
    @welcome = assign(:welcome, Welcome.create!(
      :index => "MyString"
    ))
  end

  it "renders the edit welcome form" do
    render

    assert_select "form[action=?][method=?]", welcome_path(@welcome), "post" do

      assert_select "input#welcome_index[name=?]", "welcome[index]"
    end
  end
end
