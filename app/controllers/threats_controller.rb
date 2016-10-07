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
    if params[:date_filter].present?
      Threat.where("date > ?", "#{ params[:date_filter] }".to_i.days.ago)
    else
      Threat.all
    end
  end
end
