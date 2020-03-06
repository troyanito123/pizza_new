class ReportDayJob < ApplicationJob
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    p "AQUI CAMBIO EL ESATDO DEL REPORTE A ERROR"
  end

  after_perform :after_send_report

  after_enqueue :after_task



  def perform(email, id_report)
    @report = Report.find(id_report)
    pizzas = Pizza.daily
    PizzaMailer.send_report(pizzas, email).deliver
    @report.done!
  end

  private


  def after_task
    p "%%%% AQUI CAMBIO EL ESTADO DEL REPORTE A EN ENQUEUE"
  end


  def after_send_report
    p "@!#@!# AQUI CAMBIO EL ESTADO DEL REPORTE A DONE"
  end

end
