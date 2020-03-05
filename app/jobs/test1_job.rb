class Test1Job < ApplicationJob
  queue_as :default

  def perform(msg)
    p "%%%%%%#{msg}%%%%%%%%"
  end
end
