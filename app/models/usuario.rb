class Usuario < ActiveRecord::Base
	has_and_belongs_to_many :processos
	has_and_belongs_to_many :projetos
	has_and_belongs_to_many :portfolios
	has_and_belongs_to_many :atividades
	has_many :comentarios

	has_secure_password
	validates :nome, presence: true, length: {maximum: 50}
	VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
	validates :login, presence: true, length: {minimum: 6}

end
