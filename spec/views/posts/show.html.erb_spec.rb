require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :body => "MyText",
      :attachment => "Attachment",
      :person => nil,
      :parent => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Attachment/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
