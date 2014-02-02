class Asset < ActiveRecord::Base
  belongs_to :place
  has_attached_file :image,
    :styles => {
    :thumb=> "100x100#",
    :small  => "200x200>",
    :large => "600x600>"
  }
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
 
end
