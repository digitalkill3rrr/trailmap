class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def create
    @spot = Spot.find(params[:report][:spot_id])
    @report = @spot.reports.build(report_params)
    @report.user_id = current_user.id

    @report.save
    @spot.update(status: 'на проверке')
    @ability = Ability.new(current_user)

    render 'spots/show', status: :created
  end

  def approve
    @report = Report.find(params[:id])
    @report.spot.update(status: 'неактивная')

    redirect_to reports_path
  end

  def reject
    @report = Report.find(params[:id])
    @report.spot.update(status: 'активная')

    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:body)
  end
end
