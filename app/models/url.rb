class Url < ActiveRecord::Base
   validates :original_url, :presence => true #:uniqueness => true     #<=== take out uniqueness
   before_create :shorten
 
   def shorten
     #generate a string of 5 random alphanumeric characters
     str = ""
     characters = ("a".."z").to_a + ("0".."9").to_a

     7.times do
       str += characters.sample
     end
     self.shortened_url = str
   end

   	def is_url_valid
		unless self.long_url.starts_with?("http://", "https://")
			errors.add(:long_url, "invalid format")
		end

 end
end