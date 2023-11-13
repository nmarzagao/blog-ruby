require 'sqlite3'

class Posts
    def initialize()
        @db = SQLite3::Database.new "blog.db"

        @db.execute <<-SQL
            CREATE TABLE IF NOT EXISTS posts (
                title TEXT UNIQUE,
                content TEXT
            );
        SQL
    end

    def insert(title, content)
        begin
            @db.execute "INSERT OR IGNORE INTO posts (title, content) VALUES (?, ?);", [title, content]

            return true
        rescue => exception
            return exception
        end
    end

    def get_posts()
        begin
            return @db.execute "SELECT * FROM posts;"
        rescue => exception
            return exception
        end
    end
end