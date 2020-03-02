class PizzaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pizza_mailer.send_order.subject
  #
  def send_order
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pizza_mailer.send_report.subject
  #
  def send_report
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
