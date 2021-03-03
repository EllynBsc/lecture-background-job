class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id) #using redis DB we cannot pass complex objects of oop, we need to pass id as parameters
    # Do something later
    user = User.find(user_id)
    # API CALL happening
    puts "Calling Clearbit API for #{user.email}..."
    # TODO: perform a time consuming task like Clearbit's Enrichment API.
    sleep 2
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end


# 1.redis is DB in memory that looks like a hash
# redis => serialized jobs

# {
#   job_one: "gid://background-jobs-demo/User/1",
#   [...]
# }

# active job is performing them => the jobs are getting deserialized.


# SERIALIZATION
# complex object => serie of characters

# DESERIALIZATION
# serie of characters => complex object

