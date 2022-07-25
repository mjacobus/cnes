# frozen_string_literal: true

module Cnes
  class HttpClient
    def initialize(cnes:, dados_abertos:)
      @cnes = cnes
      @dados_abertos = dados_abertos
    end

    def estabelecimentos(params = {})
      params = params(
        params,
        codigo_tipo_unidade: nil,
        estabelecimento_possui_centro_cirurgico: nil,
        estabelecimento_possui_centro_obstetrico: nil,
        limit: 20,
        offset: 0
      )

      @dados_abertos.get('/cnes/estabelecimentos', params)
    end

    def estabelecimento(cnes_id)
      @dados_abertos.get("/cnes/estabelecimentos/#{cnes_id}")
    end

    def tipos_de_unidades
      @dados_abertos.get('/cnes/tipounidades')
    end

    def tipo_de_unidade(id)
      @dados_abertos.get("/cnes/tipounidades/#{id}")
    end

    def profissionais(id)
      @cnes.get("/services/estabelecimentos-profissionais/#{id}")
    end

    def estados
      @cnes.get('/services/estados')
    end

    def cidades(estado_id)
      @cnes.get('/services/municipios', estado: estado_id)
    end

    private

    def params(params, default_params = {})
      default_params.merge(params.compact).compact
    end
  end
end
