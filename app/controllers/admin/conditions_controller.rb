class Admin::ConditionsController < Admin::BaseController
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:success] = "Created a new condition report"
      redirect_to condition_path(@condition)
    else
      flash[:error] = "Failed to create new condition report"
      render :new
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(condition_params)
      flash[:success] = "This condition has been updated"
      redirect_to condition_path(@condition)
    else
      flash[:error] = "Failed to update condition"
      render :edit
    end
  end

  def destroy
    @condition = Condition.find(params[:id])
    if @condition.destroy
      flash[:success] = "Condition deleted"
      redirect_to conditions_path
    else
      flash[:error] = "Failed to delete condition"
      redirect_to conditions_path
    end
  end

  private
    def condition_params
      params.require(:condition).permit(:date,
                                        :max_temperature_f,
                                        :mean_temperature_f,
                                        :min_temperature_f,
                                        :max_dew_point_f,
                                        :mean_dew_point_f,
                                        :min_dew_point_f,
                                        :max_humidity,
                                        :mean_humidity,
                                        :min_humidity,
                                        :max_sea_level_pressure_inches,
                                        :mean_sea_level_pressure_inches,
                                        :min_sea_level_pressure_inches,
                                        :max_visibility_miles,
                                        :mean_visibility_miles,
                                        :min_visibility_miles,
                                        :max_wind_Speed_mph,
                                        :mean_wind_speed_mph,
                                        :max_gust_speed_mph,
                                        :precipitation_inches,
                                        :cloud_cover,
                                        :events,
                                        :wind_dir_degrees,
                                        :zip_code)
    end
end
