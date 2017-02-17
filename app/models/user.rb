# frozen_string_literal: true
# :nodoc:
class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :recipes
end
