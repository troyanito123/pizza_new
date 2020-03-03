class ReportDayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReportDayJob.set(wait_until: time.end_of_minute).perform_later(send_report)
  end

  def send_report
    time = Time.new
    pizzas = Pizza.created_after(time.midnight)
    PizzaMailer.delay(run_at: time.end_of_minute).send_report(pizzas)
  end
end
