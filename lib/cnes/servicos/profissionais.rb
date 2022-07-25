# frozen_string_literal: true

module Cnes
  module Servicos
    class Profissionais
      def initialize(client:)
        @client = client
      end

      def listar(estado:, cidade:, estabelecimento:)
        id = estado_id(estado)
        id = cidade_id(cidade, estado_id: id)
        id = estabelecimento_id(estabelecimento, cidade_id: id)
        @client.profissionais(id)
      end

      private

      def estado_id(estado)
        @client.estados.each do |key, value|
          if estado.casecmp(value).zero?
            return key
          end
        end

        raise "Estado não encontado: #{estado}"
      end

      def cidade_id(cidade, estado_id:)
        @client.cidades(estado_id).each do |key, value|
          if cidade.casecmp(value).zero?
            return key
          end
        end

        raise "Cidade não encontada: #{cidade}"
      end

      def estabelecimento_id(estabelecimento, cidade_id:)
        results = @client.estabelecimentos(municipio: cidade_id, nome: estabelecimento)
        first = results.first || {}
        first.fetch('id') { raise "Estabelecimento não encontrado: #{estabelecimento}" }
      end
    end
  end
end
