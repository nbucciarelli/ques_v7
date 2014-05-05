# :environment gives us access to the Rails environment.
# If we want to query our models, we need that parameter
task assign_workflow_states: :environment do
  ques = Que.all
  ques.each do |que|
    que.workflow_state = "new"
    que.save
  end
end
