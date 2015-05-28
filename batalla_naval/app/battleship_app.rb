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

      redirect_to "/play"
    end

    get "/play" do
      @ships = [SmallShip.new, LargeShip.new]
      @positions = session[:board].positions
      session[:ships] = @ships

      render "play"
    end

    post :add_ship, map: "/board/add_ship" do
      position = position_from(params[:position])
      ship = session[:ships].at(params[:ship].to_i)

      session[:board].add_ship_at_position ship, position

      redirect_to "/play"
    end

    private
    def position_from string
      string.split(':').map{|n| n.to_i }
    end

  end

end
