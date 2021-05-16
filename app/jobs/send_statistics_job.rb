class SendStatisticsJob < ApplicationJob
  queue_as :default

  def perform
    AdminMailer.send_statistics.deliver_later
  end
end
