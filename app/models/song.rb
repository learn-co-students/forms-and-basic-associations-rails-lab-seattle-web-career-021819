class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #intercepts creation of artist name to find the correct ID
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end


  #create notes from an array
  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) unless content.empty?
    end
  end

  #print out note contents
  def note_contents
    content_arr = self.notes.map {|note| note.content}
    content_arr
  end

  # def note_ids=(ids)
  #   ids.each do |id|
  #      note = Note.find(id)
  #      self.notes << note
  #    end
  # end
end
