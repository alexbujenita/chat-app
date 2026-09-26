// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "channels/messages_channel"

const popUp = () => {
  const name = prompt("What's your name?", "...type in your name")
  if (name == null || name == "" || name === "...type in your name") {
    alert("Try again, or just chat.");
  } else {
    alert(`Welcome ${name}!`);
  }
  
}

// ES modules are scoped: home/index.html.erb calls popUp() from an inline onclick handler.
window.popUp = popUp
