require 'spec_helper'

describe "barcodes/show.html.erb" do
  before(:each) do
    @barcode = assign(:barcode, stub_model(Barcode,
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
  end
end
