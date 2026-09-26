# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Do NOT re-pin these from jspm: @popperjs/core's ESM entries (lib/index.js AND
# dist/esm/popper.js) are multi-file builds whose relative "./dom-utils/..." imports 404 once
# importmap vendors a single file. These gem-served UMD bundles are self-contained, and match
# the gem version dartsass compiles the Bootstrap CSS from.
# Order matters: bootstrap's UMD reads globalThis.Popper, so popper must be imported first.
pin "@popperjs/core", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true

pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
