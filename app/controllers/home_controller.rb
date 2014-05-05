class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @people_in_que = Que.where.not(workflow_state: "completed")
    @people_who_are_inifintely_smarter_then_they_were_before_but_still_cant_spell = Que.where(workflow_state: "completed")
  end
end
