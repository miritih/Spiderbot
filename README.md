[![CircleCI](https://circleci.com/gh/miritih/Spiderbot.svg?style=svg&circle-token=6ada86b90bba9a2d1cf6d6aa7cf2ba22e4e5e3c6)](https://circleci.com/gh/miritih/Spiderbot)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/07f97edfbdf1477792ce337f082c440b)](https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=miritih/Spiderbot&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/07f97edfbdf1477792ce337f082c440b)](https://www.codacy.com?utm_source=github.com&utm_medium=referral&utm_content=miritih/Spiderbot&utm_campaign=Badge_Coverage)

**Spiderbot** Is a crawling tool that aggregates jobs from diffrent job sources. 

## Usage

It is recommended that you have the following set up on your local environment before getting started

1. [Ruby ~> 2.6.6](https://www.ruby-lang.org/en/downloads/)
2. [Ruby on Rails ~>  6.0.0](http://rubyonrails.org/)
3. [Postgres](http://www.postgresql.org)
4. [Git](https://git-scm.com)

Clone the repository into your local environment

```bash
$ git clone git@github.com:miritih/Spiderbot.git
```

Run bundle to install all the gems

```bash
$ bundle install
```

Run the migrations

```bash
$ rails db:create db:migrate
```

If you wish to populate your database with [Faker gem](https://github.com/stympy/faker) run this;

```bash
$ rake db:populate
```

## Tests

```bash
$ rspec spec
```

## Contributing

Contributions are **welcome** and will be fully **credited**.

## Security

If you discover any security related issues, please create an issue in the repo.

## Credits

* [Eric Mwenda](https://github.com/miritih)

## License

### The MIT License (MIT)

Licensed under the [Apache License 2.0](http://www.apache.org/licenses/).
