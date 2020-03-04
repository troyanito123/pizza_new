class ReportDayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    report_daily
  end

  def report_daily
    # reports = Report.daily
    pizzas = Pizza.created_after(Time.new.midnight)
    PizzaMailer.send_report(pizzas).deliver
  end


end
