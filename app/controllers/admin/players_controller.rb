class Admin::PlayersController < AdminController
  def index
    @pagy, @players = pagy(Player.ordered, items: 10)
  end

  def new
    @player = Player.new
  end

  def edit
    @player = load_player
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admin_players_path, notice: "Jugador creado correctamente"
    else
      render :new
    end
  end

  def update
    @player = load_player
    if @player.update(player_params)
      redirect_to admin_players_path, notice: "Jugador actualizado correctamente"
    else
      render :edit
    end
  end

  private

    def player_params
      params.require(:player).permit(:name, :height, :wingspan, :weight, :birthday, :dorsal, :position, :team_id)
    end

    def load_player
      Player.find(params[:id])
    end
end
