class SendMailController < ApplicationController
  def report_day
    time = Time.new
    pizzas = Pizza.created_after(time.midnight)
    PizzaMailer.delay(run_at: time.end_of_day).send_report(pizzas)
  end
end
