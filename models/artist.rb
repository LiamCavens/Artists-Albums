require('pg')
require_relative('../db/sql_runner.rb')

class Artist

    attr_reader :id
    attr_accessor :name

    def initialize(options)
        @id = options["id"].to_i
        @name = options["name"]
    end

    def save()
        sql = "INSERT INTO artists name VALUES $1 RETURNING id;"
        values = [@name]
        result = SqlRunner.run(sql, values)
        @id = result[0]["id"].to_i()
    end

    def delete()
    sql = "DELETE FROM artist WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
        SqlRunner.run(sql)
    end
end