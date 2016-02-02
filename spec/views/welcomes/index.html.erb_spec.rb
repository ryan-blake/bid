require 'rails_helper'

RSpec.describe "welcomes/index", type: :view do
  before(:each) do
    assign(:welcomes, [
      Welcome.create!(
        :index => "Index"
      ),
      Welcome.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of welcomes" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
