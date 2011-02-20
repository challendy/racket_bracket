require 'spec_helper'

describe "tournaments/edit.html.haml" do
  before(:each) do
    @tournament = assign(:tournament, stub_model(Tournament))
  end

  it "renders the edit tournament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tournaments_path(@tournament), :method => "post" do
    end
  end
end
