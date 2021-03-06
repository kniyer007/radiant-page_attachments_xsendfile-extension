require File.dirname(__FILE__) + '/../spec_helper'

describe SiteController, 'with xsendfile' do
  dataset :page_attachments
  
  before do
    @page = pages(:first)
    @attachment = page_attachments(:first)
    File.stub!(:file?).and_return(true)
    File.stub!(:readable?).and_return(true)
    File.stub!(:size).and_return(@attachment.size)
  end
  
  
  describe "alias chain" do
    it "should be set up" do
      controller.should respond_to(:show_page_with_attachments)
    end
  end
  
  it "should find an attachment under the page it's attached to" do
    get :show_page, :url => 'first/rails.png'
    response.should be_success
    response.headers.should include("X-Sendfile")
    response.headers["X-Sendfile"].should == @attachment.full_filename
  end

end