class ReportCustomJob < ApplicationJob
  queue_as :default

  def perform(email)
    pizzas = Pizza.daily
    PizzaMailer.send_report(pizzas, email).deliver
  end
end
