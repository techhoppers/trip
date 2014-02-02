require "net/http"
require "nokogiri"
class Place < ActiveRecord::Base
  acts_as_taggable
  has_many :reviews
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :reject_if => proc { |attributes| attributes['image'].blank? }, :allow_destroy => true

  def to_param
    "#{id}-#{title}-#{tag_list.join("-").gsub(" ","")}"
  end
  
  def to_title
    ": #{title} - #{tag_list.join(", ")}"
  end
  
  def get_distance(destination)
    value = Hash.new
    uri = "http://maps.googleapis.com/maps/api/distancematrix/xml?origins=#{destination.gsub(" ","")}&destinations=#{title.gsub(" ","")}&mode=driving&sensor=false"
    puts uri
    url = URI.parse(uri)
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    begin
      doc = Nokogiri::XML(res.body)
      doc.root.children.each do |node|
        if node.name == "row"
          node.children.children.each do |row_child|
            if row_child.name == "distance"
              row_child.children.each do |distance|
                value[:distance] = distance.text if distance.name == "text" && distance.text.present?
              end
            end
            if row_child.name == "duration"
              row_child.children.each do |duration|
                value[:hours] = duration.text if duration.name == "text" && duration.text.present?
              end
            end
          end
        end
      end
      puts value
      value
   
    end
  end
end
