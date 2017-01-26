class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :measures
  validate :url_format

  validates :title, :category_id, :user_id, :time, :difficulty, :directions, presence: true
  def url_format
    puts self.image_url
    puts
    url_matcher = !!(self.image_url =~ /^http:\/\/\S*\.{1}[a-zA-Z]{3}/)
    print self.image_url == 'http://i.imgur.com/VDI7NXx.jpg'
    print ' || '
    print url_matcher
    unless self.image_url == 'http://i.imgur.com/VDI7NXx.jpg' || url_matcher
      errors.add(:image_url, 'Must be blank or a valid image url')
    end
  end
end
