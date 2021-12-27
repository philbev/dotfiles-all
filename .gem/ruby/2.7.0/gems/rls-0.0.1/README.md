# RLS [Release]

Heroku deployment wrapper (rubygem). RLS aims at making Heroku deploys a bit
easier

What it currently does/support:

* deploys you app to Heroku
* Notifies NewRelic of the deployment

## Things to come (todo)

* push to origin
* create diff/changelog
* notify airbrake
* tests!
* run migrations

## Installation

`gem install rls` or add `gem 'rls'` to your `Gemfile`

## Usage

    Usage: rls [options]
    Defaults to: rls -r heroku -b master -e production -a off -f false -d false
    where [options] are:
        --remote, -r <s>:   Remote git repo (default: heroku)
        --branch, -b <s>:   Branch to push (default: master)
           --env, -e <s>:   Environment (default: production)
      --app-name, -a <s>:   Newrelic app name (default: off)
             --force, -f:   Force push update
             --debug, -d:   Only print, not perform actions
           --version, -v:   Print version and exit
              --help, -h:   Show this message

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b release-brainz`)
3. Commit your changes (`git commit -am 'Add mega release brainz!!!'`)
4. Push to the branch (`git push origin release-brainz`)
5. Create new Pull Request
6. Go buy a Porche (you've earned it!)

## Licence (MIT)

Copyright (c) 2012 Jesper Kjeldgaard

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
