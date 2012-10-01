require 'spec_helper'

describe "barcodes/edit.html.erb" do
  before(:each) do
    @barcode = assign(:barcode, stub_model(Barcode,
      :code => "MyString"
    ))
  end

  it "renders the edit barcode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barcodes_path(@barcode), :method => "post" do
      assert_select "input#barcode_code", :name => "barcode[code]"
    end
  end
end
