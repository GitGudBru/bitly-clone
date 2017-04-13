
 #    #generate a string of 5 random alphanumeric characters
 #    str = ""
 #    characters = ("a".."z").to_a + ("0".."9").to_a
 #    5.times do
 #     str = characters.sample + str
 #    end
 #    shortened_url = str
 #    p shortened_url
 #

class Url < ActiveRecord::Base
  validates :original_url, presence: true
  #uniqueness: true
  before_create :shorten #. :count

  def shorten 
  #blabalblablablablablabalblablabalabl
  	str = 5.times.map { ['0'..'9', 'a'..'z', 'A'..'Z'].sample }.join
  self.shortened_url = str
  end
end