[![Latest Build Status](https://github.com/goofball222/stunnel/actions/workflows/build-latest.yml/badge.svg)](https://github.com/goofball222/stunnel/actions/workflows/build-latest.yml) [![Docker Pulls](https://img.shields.io/docker/pulls/goofball222/stunnel.svg)](https://hub.docker.com/r/goofball222/stunnel/) [![Docker Stars](https://img.shields.io/docker/stars/goofball222/stunnel.svg)](https://hub.docker.com/r/goofball222/stunnel/) [![MB License](https://images.microbadger.com/badges/license/goofball222/stunnel.svg)](https://microbadger.com/images/goofball222/stunnel)

# goofball222/stunnel - fork of frediweber/stunnel

## Stunnel on Alpine
To secure an LDAP container named `directory`:

```
docker run -itd --name ldaps --link directory:ldap \
        -e STUNNEL_SERVICE=ldaps \
        -e STUNNEL_ACCEPT=636 \
        -e STUNNEL_CONNECT=ldap:389 \
        -p 636:636 \
#       -v /etc/ssl/private/server.key:/etc/stunnel/stunnel.key:ro \
#       -v /etc/ssl/private/server.crt:/etc/stunnel/stunnel.pem:ro \
    goofball222/stunnel
```

### Copyright Notice
>The [MIT License](LICENSE.txt) ([MIT](https://opensource.org/licenses/MIT))
>
> Copyright &copy; 2015-2017 [Jacob Blain Christen](https://github.com/dweomer)
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of
> this software and associated documentation files (the "Software"), to deal in
> the Software without restriction, including without limitation the rights to
> use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
> the Software, and to permit persons to whom the Software is furnished to do so,
> subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
> FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
> COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
> IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
