class ReportWeekJob < ApplicationJob
  queue_as :default

  def perform(email)
    pizzas = Pizza.weekly
    PizzaMailer.send_report(pizzas, email).deliver
  end
end
