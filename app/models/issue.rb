class Issue < ActiveRecord::Base
  has_attached_file :photo, :styles => { :original => "167x248>" },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :s3_protocol => "https",
  :bucket => 'equinecanada'

    validates_attachment_presence :photo
    validates_attachment_size :photo, :less_than => 50.kilobytes
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg']
end
