class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    #code
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)

    self.genre = Genre.find_or_create_by(name: name)
    #code
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    #code
  end

  def genre_id
    self.genre ? self.genre.name : nil
    #code
  end

end
