# app/workers/my_cron_worker.rb
class MyCronWorker
    include Sidekiq::Worker
  
    def perform(*args)
      # Your job logic here
      Account.update_all(first_name: 'ram')
    end
  end
  