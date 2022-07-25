# frozen_string_literal: true

module Cnes
  module Servicos
    class ProfissionaisFactory
      def create
        client = HttpClientFactory.new.create

        Profissionais.new(client: client)
      end
    end
  end
end
