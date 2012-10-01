require 'spec_helper'

describe "barcodes/new.html.erb" do
  before(:each) do
    assign(:barcode, stub_model(Barcode,
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new barcode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => barcodes_path, :method => "post" do
      assert_select "input#barcode_code", :name => "barcode[code]"
    end
  end
end
