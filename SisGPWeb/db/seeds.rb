# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Usuario.create(nome: 'marco', email:'ma@gmail.com', telefone:'124',login: 'login',password_digest: '123')

Processo.create(nome: 'processo1', descricao:'alo', dono_id: 1)

