class ReportDayJob < ApplicationJob
  queue_as :default

  def perform(*args)

  end

  def report_daily
    PizzaMailer.delay(run_at: time.end_of_minute).send_report(report)
  end


end
