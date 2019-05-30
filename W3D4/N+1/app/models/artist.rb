class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    albums = self
      .albums
      .select('albums.*, COUNT(*) AS tracks_count')
      .joins(:tracks)
      .group('albums.id')

      #Ok, so the thing I understand is that the querying the DB was done in one step,
      #as oppposed to N + 1 query steps. 

      #as result of getting all the data in one DB query, we got the album counts
    album_counts = {}
    albums.each do |album| #this return an array of instances right?
      album_counts[album.title] = album.tracks_countend
    end

    #return a hash of album titles and album tracks k/v pair
    album_counts

  end
end
