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

  it 'raises error when estado is invalid' do
    VCR.use_cassette('services/busca-estado-invalido') do
      expect do
        profissionais.listar(
          estado: 'x',
          cidade: 'PORTO ALEGRE',
          estabelecimento: 'SANTA CASA'
        )
      end.to raise_error(Cnes::InvalidArgumentError)
    end
  end

  it 'raises error when cidade is invalid' do
    VCR.use_cassette('services/busca-cidade-invalido') do
      expect do
        profissionais.listar(
          estado: 'RIO GRANDE DO SUL',
          cidade: 'PORTO ALEGRE-invalid',
          estabelecimento: 'SANTA CASA'
        )
      end.to raise_error(Cnes::InvalidArgumentError)
    end
  end

  it 'raises error when estabelecimento is invalid' do
    VCR.use_cassette('services/busca-estabelecimento-invalido') do
      expect do
        profissionais.listar(
          estado: 'RIO GRANDE DO SUL',
          cidade: 'PORTO ALEGRE',
          estabelecimento: 'SANTA CASA-invalid'
        )
      end.to raise_error(Cnes::InvalidArgumentError)
    end
  end
end
