namespace :user do
  # FIRST TASK
  desc "Enriching all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user.id)
    end
    puts "Thank you the queue process was setup!"
    # rake task will return when all jobs are _enqueued_ (not done).
  end
  # SECOND TASK for a specific user
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end