class ReportMonthJob < ApplicationJob
  queue_as :default

  def perform(email)
    pizzas = Pizza.monthly
    PizzaMailer.send_report(pizzas, email).deliver
  end
end
