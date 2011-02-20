require 'spec_helper'

describe "tournaments/index.html.haml" do
  before(:each) do
    assign(:tournaments, [
      stub_model(Tournament),
      stub_model(Tournament)
    ])
  end

  it "renders a list of tournaments" do
    render
  end
end
