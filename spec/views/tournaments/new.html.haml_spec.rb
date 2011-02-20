require 'spec_helper'

describe "tournaments/new.html.haml" do
  before(:each) do
    assign(:tournament, stub_model(Tournament).as_new_record)
  end

  it "renders new tournament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tournaments_path, :method => "post" do
    end
  end
end
