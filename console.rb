require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({
    "name" => "Oasis"
})

artist1.save()

album1 = Album.new ({
    "album_name" => "Definitely Maybe",
    "genre" => "Indie Rock",
    "artist_id" => artist1.id()
})

album1.save()






binding.pry
nil