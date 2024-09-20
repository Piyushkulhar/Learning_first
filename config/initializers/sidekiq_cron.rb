require 'sidekiq/cron'

Sidekiq::Cron::Job.create(
  name: 'My Cron Job - every 1 minute',
  cron: '* * * * *', # Runs every minute
  class: 'MyCronWorker'
)
