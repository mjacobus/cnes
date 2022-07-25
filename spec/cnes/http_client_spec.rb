# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cnes::HttpClient do
  let(:client) { Cnes::HttpClientFactory.new.create }

  it 'busca estabelecimentos' do
    VCR.use_cassette('estabelecimentos') do
      data = client.estabelecimentos

      expect(data['estabelecimentos'].length).to eq(20)
    end
  end

  it 'busca estabelecimento by cnes' do
    VCR.use_cassette('estabelecimentos/169993') do
      data = client.estabelecimento(16_993)

      expect(data['numero_cnpj_entidade']).to eq('76417005000186')
    end
  end

  it 'busca tipos de unidade' do
    VCR.use_cassette('tipos_unidade') do
      data = client.tipos_de_unidades

      expect(data['tipos_unidade'].first['codigo_tipo_unidade']).to eq(80)
    end
  end

  it 'busca tipo de unidade por código' do
    VCR.use_cassette('tipos_unidade/80') do
      data = client.tipo_de_unidade(80)

      expect(data['descricao_tipo_unidade']).to eq('LABORATORIO DE SAUDE PUBLICA')
    end
  end

  it 'busca estados' do
    VCR.use_cassette('estados') do
      data = client.estados

      expect(data['43']).to eq('RIO GRANDE DO SUL')
    end
  end

  it 'busca cidades' do
    VCR.use_cassette('cidades') do
      data = client.cidades(43)

      expect(data['431490']).to eq('PORTO ALEGRE')
    end
  end

  describe '#profissionais' do
    it 'busca todos os profissionais por id do estabelecimento' do
      VCR.use_cassette('profissionais/4314902237253') do
        data = client.profissionais('4314902237253')

        expect(data.first.keys).to eq(
          %w[
            tpSusNaoSus
            cbo
            dsCbo
            chOutros
            chAmb
            chHosp
            vinculacao
            vinculo
            subVinculo
            nome
            cns
            cnsMaster
            artigo2
            artigo3
            artigo5
            dtEntrada
          ]
        )
      end
    end
  end
end
