require 'spec_helper'

describe "barcodes/index.html.erb" do
  before(:each) do
    assign(:barcodes, [
      stub_model(Barcode,
        :code => "Code"
      ),
      stub_model(Barcode,
        :code => "Code"
      )
    ])
  end

  it "renders a list of barcodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
