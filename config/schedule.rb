every 1.week do
  runner 'SendStatisticsJob.perform_later'
end
