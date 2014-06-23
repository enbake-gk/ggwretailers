json.array!(@jobs) do |job|
  json.extract! job, :id, :date_of_job, :service_notes, :time_spent, :claimed, :warrenty_job, :servicetech
  json.url job_url(job, format: :json)
end
