class ReportMonthJob < ApplicationJob
  queue_as :default

  def perform(email, id_report)
    report = Report.find(id_report)
    pizzas = Pizza.monthly
    PizzaMailer.send_report(pizzas, email).deliver
    report.done!
  end
end
