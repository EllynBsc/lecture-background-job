class FakeJob < ApplicationJob
  queue_as :default #order of importance is for now the default one

  def perform(*args)
    # *args means you can take an array of arguments.
    puts "1.I'm starting the fake job"
    sleep 5
    puts "2.OK I'm done now"
    puts "3. BYEEEE"
  end

  # perform_now is calling a job to be run synchronously
  # perform_later is calling a job to be run later/asynchronously
end
