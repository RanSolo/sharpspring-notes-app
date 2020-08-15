# frozen_string_literal: true

# note model
class User < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  end

  def encrypt_password
    return if password.blank?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
