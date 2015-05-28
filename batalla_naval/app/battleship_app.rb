module BatallaNaval

  class BattleshipApp < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers
    register Padrino::Sprockets

    enable :sessions
    enable :protection

  end

end
