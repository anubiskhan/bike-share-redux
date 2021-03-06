class ConditionsController < ApplicationController
  before_action :set_condition, only: %i[show]
  def index
    @conditions = Condition.all
  end

  def show; end

  private

    def condition_params
      params.require(:condition).permit(
        :date,
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
        :max_wind_speed_mph,
        :mean_wind_speed_mph,
        :max_gust_speed_mph,
        :precipitation_inches,
        :cloud_cover,
        :events,
        :wind_dir_degrees,
        :zip_code
      )
    end

    def set_condition
      @condition = Condition.find(params[:id])
    end
end
