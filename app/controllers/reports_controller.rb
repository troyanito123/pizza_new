class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def new
    @days = %w(monday tuesday wednesday thursday friday saturday sunday)
    @prevalence = %w(daily weekly monthly)
    @report = Report.new
  end

  def create
    @days = %w(monday tuesday wednesday thursday friday saturday sunday)
    @prevalence = %w(daily weekly monthly)
    @report = Report.new(report_params)
    if @report.save
      flash[:success] = I18n.t 'report.create'
      redirect_to reports_path
    else
      render :new
    end

  end

  def report_on
    @id = params['id']
    @report = Report.find(@id)
    @report.state = true
    unless @report.save
      render :index
    end
  end

  def report_off
    @id = params['id']
    @report = Report.find(@id)
    @report.state = false
    unless @report.save
      render :index
    end
  end

  private
  def report_params
    params.require(:report).permit('day', 'time(4i)', 'time(5i)', 'prevalence', 'email')
  end
end
