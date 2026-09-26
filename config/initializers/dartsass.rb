# Bootstrap 5.3.8 still uses `@import`, the global Sass built-ins and the legacy
# colour functions internally, which makes `dartsass:build` emit ~330 deprecation
# warnings that we cannot act on. `--quiet-deps` silences warnings coming from
# stylesheets loaded through a --load-path (i.e. the bootstrap gem) while keeping
# warnings from this application's own stylesheets visible.
#
# Appended rather than assigned so the gem defaults ("--style=compressed" and
# "--no-source-map", set in Dartsass::Engine) are preserved.
Rails.application.config.dartsass.build_options << "--quiet-deps"
