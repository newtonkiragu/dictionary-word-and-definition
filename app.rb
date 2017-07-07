require('sinatra')
require('sinatra/reloader')
require('descriptive_statistics')
# require('./lib/word_count')
# also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
