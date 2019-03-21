class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs

  def songs_ids=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.songs << song
    end
  end
  
end
