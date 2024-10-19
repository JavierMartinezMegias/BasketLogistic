class Admin::PlayersController < AdminController
  def index
    @team = load_team
    @pagy, @players = pagy(@team.players.ordered, items: 10)
  end

  def new
    @team = load_team
    @player = Player.new
  end

  def edit
    @team = load_team
    @player = load_player
  end

  def create
    @team = load_team
    @player = @team.players.new(player_params)
    if @player.save
      redirect_to admin_team_players_path, notice: "Jugador creado correctamente"
    else
      render :new
    end
  end

  def update
    @player = load_player
    if @player.update(player_params)
      redirect_to admin_team_players_path, notice: "Jugador actualizado correctamente"
    else
      render :edit
    end
  end

  private

    def player_params
      params.require(:player).permit(:name, :height, :wingspan, :weight, :birthday, :dorsal, :position, :team_id)
    end

    def load_player
      load_team.players.find(params[:id])
    end

    def load_team
      Team.find(params[:team_id])
    end
end
