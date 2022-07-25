# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cnes::HttpClient do
  let(:client) { Cnes::HttpClientFactory.new.create }

  it 'busca estabelecimentos' do
    data = client.estabelecimentos

    expect(data['estabelecimentos'].length).to eq(20)
  end

  it 'busca estabelecimento by cnes' do
    data = client.estabelecimento(16_993)

    expect(data['numero_cnpj_entidade']).to eq('76417005000186')
  end

  it 'busca tipos de unidade' do
    data = client.tipos_de_unidades

    expect(data['tipos_unidade'].first['codigo_tipo_unidade']).to eq(80)
  end

  it 'busca tipo de unidade por código' do
    data = client.tipo_de_unidade(80)

    expect(data['descricao_tipo_unidade']).to eq('LABORATORIO DE SAUDE PUBLICA')
  end
end
