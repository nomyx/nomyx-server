FROM haskell:8.0.1

COPY nomyx-server.cabal                           /opt/Nomyx/nomyx-server/nomyx-server.cabal
COPY ../nomyx-core/nomyx-core.cabal               /opt/Nomyx/nomyx-core/nomyx-core.cabal
COPY ../nomyx-language/nomyx-language.cabal       /opt/Nomyx/nomyx-language/nomyx-language.cabal
COPY ../nomyx-library/nomyx-library.cabal         /opt/Nomyx/nomyx-library/nomyx-library.cabal
COPY ../nomyx-web/nomyx-web.cabal                 /opt/Nomyx/nomyx-web/nomyx-web.cabal
COPY ../nomyx-api/nomyx-api.cabal                 /opt/Nomyx/nomyx-api/nomyx-api.cabal
COPY ../nomyx-auth/nomyx-auth.cabal               /opt/Nomyx/nomyx-auth/nomyx-auth.cabal
COPY ../imprevu/imprevu.cabal                     /opt/Nomyx/imprevu/imprevu.cabal
COPY ../imprevu-happstack/imprevu-happstack.cabal /opt/Nomyx/imprevu-happstack/imprevu-happstack.cabal
COPY ../shortcut/shortcut.cabal                   /opt/Nomyx/shortcut/shortcut.cabal

WORKDIR /opt/Nomyx/nomyx-server
RUN stack install --system-ghc --only-snapshot 

COPY .. /opt/Nomyx
RUN stack install --system-ghc 

ENV PATH /usr/bin:$PATH
CMD stack exec --system-ghc -- nomyx-server -p localhost:8000 --noTTY

EXPOSE 8000
EXPOSE 8001
