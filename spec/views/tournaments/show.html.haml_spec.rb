require 'spec_helper'

describe "tournaments/show.html.haml" do
  before(:each) do
    @tournament = assign(:tournament, stub_model(Tournament))
  end

  it "renders attributes in <p>" do
    render
  end
end
