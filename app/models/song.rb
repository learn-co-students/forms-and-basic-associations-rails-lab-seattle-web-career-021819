class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end




  def note_contents=(song_notes)
    song_notes.each do |note_content|
      if note_content.strip != ""
        self.notes << Note.find_or_create_by(content: note_content)
      end
    end
    self.save
  end

  def note_contents
    # byebug
    self.notes ? self.notes.pluck(:content) : nil
  end

end
