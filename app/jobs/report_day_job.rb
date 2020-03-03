class ReportDayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts '##########HOLA###############'
  end


end
