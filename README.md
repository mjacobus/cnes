# Cnes

[![Ruby](https://github.com/mjacobus/cnes/actions/workflows/main.yml/badge.svg)](https://github.com/mjacobus/cnes/actions/workflows/main.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/34d8d7c160ea1a9946ce/maintainability)](https://codeclimate.com/github/mjacobus/cnes/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/cnes/badge.svg?branch=main)](https://coveralls.io/github/mjacobus/cnes?branch=main)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cnes

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cnes

## Usage


```ruby
require "cnes"

profissionais = Cnes::Servicos::ProfissionaisFactory.new.create

resultados = profissionais.listar(
  estado: 'RIO GRANDE DO SUL',
  cidade: 'PORTO ALEGRE',
  estabelecimento: 'SANTA CASA'
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Links úteis

- https://dados.gov.br/dataset/cadastro-nacional-de-estabelecimentos-de-saude-cnes1
- API
  - [Tipos de Unidades](https://apidadosabertos.saude.gov.br/cnes/tipounidades)
  - [Tipos de Unidade](https://apidadosabertos.saude.gov.br/cnes/tipounidades/80)
  - [Estabelecimentos](https://apidadosabertos.saude.gov.br/cnes/estabelecimentos?codigo_tipo_unidade=80&estabelecimento_possui_centro_cirurgico=0&estabelecimento_possui_centro_obstetrico=0&limit=20&offset=2)
  - [Estabelecimento pelo código CNES](https://apidadosabertos.saude.gov.br/cnes/estabelecimentos/124)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mjacobus/cnes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mjacobus/cnes/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cnes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mjacobus/cnes/blob/main/CODE_OF_CONDUCT.md).
