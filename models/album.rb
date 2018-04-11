require('pg')
require_relative('../db/sql_runner.rb')

class Album

    attr_reader :id
    attr_accessor :album_name, :genre, :artist_id

    def initialize(options)
        @id = options["id"].to_i
        @album_name = options["album_name"]
        @genre = options["genre"]
        @artist_id = options["artist_id"].to_i()
    end

    def save()
        sql = "INSERT INTO albums (album_name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
        values = [@album_name, @genre, @artist_id]
        result = SqlRunner.run(sql, values)
        @id = result[0]["id"].to_i()
    end

    def update()
    sql = "UPDATE album SET (album_name, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@album_name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
    end

    def Album.all()
    sql = "SELECT * FROM albums;"
    list_of_albums = SqlRunner.run(sql)
    return list_of_albums.map{|album| self.new(album)}
    end

    def delete()
    sql = "DELETE FROM album WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM albums"
        SqlRunner.run(sql)
    end

    def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)
    artist_hash = result[0]
    return Customer.new(artist_hash)
    end
end