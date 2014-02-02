class Review < ActiveRecord::Base
 belongs_to :place
 belongs_to :user
 validates_presence_of :message, :user_id, :place_id
end
