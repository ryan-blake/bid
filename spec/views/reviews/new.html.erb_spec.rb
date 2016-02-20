require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :title => "MyString",
      :author => "MyString",
      :content => "MyString",
      :rating => 1,
      :laborer => nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_title[name=?]", "review[title]"

      assert_select "input#review_author[name=?]", "review[author]"

      assert_select "input#review_content[name=?]", "review[content]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_laborer_id[name=?]", "review[laborer_id]"
    end
  end
end
