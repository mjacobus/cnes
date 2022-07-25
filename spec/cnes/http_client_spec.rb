# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cnes::HttpClient do
  let(:client) { Cnes::HttpClientFactory.new.create }

  it 'fetches estabelecimentos' do
    data = client.estabelecimentos

    expect(data['estabelecimentos'].length).to eq(20)
  end

  it 'fetches estabelecimento by cnes' do
    data = client.estabelecimento(16_993)

    expect(data['numero_cnpj_entidade']).to eq('76417005000186')
  end
end
