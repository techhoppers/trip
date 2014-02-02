class City < ActiveRecord::Base
  belongs_to :state
  belongs_to :place
end
