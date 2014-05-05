module QuesHelper
  def display_links(person)
    if person.workflow_state == 'new'
      link_to "Help This Student", 'javascript:void(0)', class: "help_this_student change_workflow", que_url: help_student_que_path(person)
    elsif person.workflow_state == 'in_progress'
      a = link_to "Resolve", 'javascript:void(0);', class: "resolve_student change_workflow", que_url: resolve_student_que_path(person)
      a += ' | '
      a += link_to "Still Confused", 'javascript:void(0);',class: "still_confused change_workflow", que_url: try_helping_student_que_path(person)
      a
    elsif person.workflow_state == 'still_confused'
      link_to "Re Help", 'javascript:void(0);', class: "re_help change_workflow", que_url: help_student_que_path(person)
    end
  end
end
