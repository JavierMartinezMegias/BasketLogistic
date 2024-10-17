class Admin::TrainingDaysController < AdminController
  def index
    @player = load_player
    @pagy, @training_days = pagy(@player.training_days.ordered, items: 10)
  end

  def new
    @player = load_player
    @training_day = TrainingDay.new
  end

  def edit
    @player = load_player
    @training_day = load_training_day
  end

  def create
    @player = load_player
    @training_day = @player.training_days.new(training_day_params)
    if @training_day.save
      redirect_to admin_player_training_days_path, notice: "Entrenamiento creado correctamente"
    else
      render :new
    end
  end

  def update
    @player = load_player
    @training_day = load_training_day
    if @training_day.update(training_day_params)
      redirect_to admin_player_training_days_path, notice: "Entrenamiento actualizado correctamente"
    else
      render :edit
    end
  end

  private

    def training_day_params
      params.require(:training_day).permit(:free_throws_scored, :two_point_shots_scored, :three_points_shots_scored, :free_throws_totals, :two_point_shots_totals, :three_points_shots_totals, :training_date)
    end

    def load_training_day
      load_player.training_days.find(params[:id])
    end

    def load_player
      Player.find(params[:player_id])
    end
end
