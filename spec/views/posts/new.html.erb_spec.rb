require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :body => "MyText",
      :attachment => "MyString",
      :person => nil,
      :parent => nil
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "textarea#post_body[name=?]", "post[body]"
      assert_select "input#post_attachment[name=?]", "post[attachment]"
      assert_select "input#post_person[name=?]", "post[person]"
      assert_select "input#post_parent[name=?]", "post[parent]"
    end
  end
end
