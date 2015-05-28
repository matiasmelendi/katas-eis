module BatallaNaval

  class BattleshipApp < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers
    register Padrino::Sprockets

    enable :sessions
    enable :protection

    layout :battleship

    get "/" do

      render "create_board"
    end

    post :board_create, map: "/board/create" do
      @board = BattleshipBoard.new_with_dimension(params[:rows].to_i, params[:columns].to_i)
      session[:board] = @board
    end

  end

end
