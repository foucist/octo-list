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
end
