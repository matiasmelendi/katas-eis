Padrino.configure_apps do

end

# Mounts the core application for this project
Padrino.mount('BatallaNaval::BattleshipApp', :app_file => Padrino.root('app/battleship_app.rb')).to('/')
