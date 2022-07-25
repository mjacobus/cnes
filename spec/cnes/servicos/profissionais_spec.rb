# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cnes::Servicos::Profissionais do
  let(:profissionais) { Cnes::Servicos::ProfissionaisFactory.new.create }

  it 'busca por cidade, estado e estabelecimento' do
    VCR.use_cassette('services/listar') do
      resultados = profissionais.listar(
        estado: 'RIO GRANDE DO SUL',
        cidade: 'PORTO ALEGRE',
        estabelecimento: 'SANTA CASA'
      )

      expect(resultados.length).to eq(11_633)
    end
  end
end
