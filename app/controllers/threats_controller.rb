class ThreatsController < ApplicationController
  def index
    @threats = find_threats

    respond_to do |format|
      format.html { render component: 'Threats', props: { threats: @threats } }
      format.json { render json: @threats }
    end
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
