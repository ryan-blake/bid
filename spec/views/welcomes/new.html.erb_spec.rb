require 'rails_helper'

RSpec.describe "welcomes/new", type: :view do
  before(:each) do
    assign(:welcome, Welcome.new(
      :index => "MyString"
    ))
  end

  it "renders new welcome form" do
    render

    assert_select "form[action=?][method=?]", welcomes_path, "post" do

      assert_select "input#welcome_index[name=?]", "welcome[index]"
    end
  end
end
