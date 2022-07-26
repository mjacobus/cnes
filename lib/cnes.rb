# frozen_string_literal: true

require_relative 'cnes/version'
require 'koine/rest_client'
require_relative 'cnes/http_client'
require_relative 'cnes/http_client_factory'
require_relative 'cnes/servicos/profissionais'
require_relative 'cnes/servicos/profissionais_factory'

module Cnes
  class Error < StandardError; end
  class InvalidArgumentError < Error; end
  # Your code goes here...
end
