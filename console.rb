require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({
    "name" => "Oasis"
})

artist1.save()

artist2 = Artist.new ({
    "name" => "Mumford & Sons"
})

artist2.save()

album1 = Album.new ({
    "album_name" => "Definitely Maybe",
    "genre" => "Indie Rock",
    "artist_id" => artist1.id()
})

album1.save()

album2 = Album.new ({
    "album_name" => "Be Here Now",
    "genre" => "Indie Rock",
    "artist_id" => artist1.id()
})

album2.save()

album3 = Album.new ({
    "album_name" => "Babel",
    "genre" => "Country",
    "artist_id" => artist2.id()
})

album3.save()

album4 = Album.new ({
    "album_name" => "Wilder Mind",
    "genre" => "Country Rock",
    "artist_id" => artist2.id()
})

album4.save()



album1.save()






binding.pry
nil