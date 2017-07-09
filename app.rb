require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')
require('pry')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/about') do
  erb(:about)
end

get('/words/new')do
  erb(:words_form)
end

get('/words')do
  @words = Word.all()
  erb(:words)
end

post('/words')do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:success)
end

get('/path_to_definitions/:id') do
  @definition = definition.find(params.fetch('id').to_i())
  erb(:words)
end

get('/words/:id')do
  id = params.fetch('id').to_i
  @word = Word.find(id)

  erb(:word)
end

get('/words/:id/definitions/new')do
  id = params.fetch('id').to_i
  @word = Word.find(id)
  erb(:word_definition_form)
end

post('/definitions')do
  name = params.fetch('name')
  @definition = Definition.new({name:name})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success)
end
