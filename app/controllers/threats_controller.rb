class ThreatsController < ApplicationController
  def index
    @threats = find_threats

    render component: 'Threats', props: { threats: @threats }
  end

  def filter
    @threats = find_threats
    render json: @threats
  end

  private
  def find_threats
    threats = Threat.all
    threats = threats.where("date > ?", "#{ params[:date_filter] }".to_i.days.ago) if params[:date_filter].present?
    params.fetch(:averages_filter, {}).each do |key, value|
      next if value === 'false'
      threats = threats.where("#{ key.to_s } > ?", Threat.average(key.to_sym).to_i)
    end
    threats
  end
end
