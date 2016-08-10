# set the database based on the current environment
database_name = "to-do-app-#{ToDoApp.environment}"
db            = URI.parse(ENV['DATABASE_URL'] || "sqlite3://localhost/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'sqlite3' ? 'sqlite3' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => "#{database_name}",
  :encoding => 'utf8'
)
