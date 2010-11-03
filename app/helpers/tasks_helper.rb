module TasksHelper
  def auto_link(x)
    super(x).gsub(/#(\w*)/) { link_to("##{$1}", task_path($1), :id => "tag")  }
  end

  def type_of(x)
    case
    when x.done?
      'id="complete"'
    when x.sticky?
      'id="sticky"'
    end
  end

  def link_to_days(day)
    link_to("Previous day", task_path(day.yesterday)) +"\n"+ link_to("Next day", task_path(day.tomorrow))
  end
end
