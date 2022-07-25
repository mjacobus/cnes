# frozen_string_literal: true

module Cnes
  class HttpClientFactory
    def create
      request = Koine::RestClient::Request.new(
        base_url: 'http://cnes.datasus.gov.br',
        headers: { 'Referer' => 'http://cnes.datasus.gov.br' }
      )

      cnes = Koine::RestClient::Client.new(base_request: request)

      request = Koine::RestClient::Request.new(
        base_url: 'https://apidadosabertos.saude.gov.br/'
      )

      dados_abertos = Koine::RestClient::Client.new(base_request: request)

      HttpClient.new(cnes: cnes, dados_abertos: dados_abertos)
    end
  end
end
