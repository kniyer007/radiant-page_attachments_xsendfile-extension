class PageAttachmentsDataset < Dataset::Base
  uses :pages
  
  def load
    create_record :page_attachment, :first, :content_type => 'image/jpeg', :filename => 'rails.png', :size => 9254, :page_id => pages(:first).id
  end
end