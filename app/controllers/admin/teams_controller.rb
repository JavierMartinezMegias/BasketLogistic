class Admin::TeamsController < AdminController
  def index
    @pagy, @teams = pagy(Team.ordered, items: 10)
  end

  def new
    @team = Team.new
  end

  def edit
    @team = load_team
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path, notice: "Equipo creado correctamente"
    else
      render :new
    end
  end

  def update 
    @team = load_team
    if @team.update(team_params)
      redirect_to admin_teams_path, notice: "Equipo actualizado correctamente"
    else
      render :edit
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :trainner)
    end

    def load_team
      Team.find(params[:id])
    end
end
