require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "MyString",
      :person => nil,
      :post => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_person[name=?]", "comment[person]"
      assert_select "input#comment_post[name=?]", "comment[post]"
    end
  end
end
