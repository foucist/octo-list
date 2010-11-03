class Task < ActiveRecord::Base
  acts_as_taggable

  named_scope :by_day, lambda { |d| { :conditions => {:created_at => d.beginning_of_day..d.end_of_day} } }
  named_scope :sticky, :conditions => {:sticky => true}
  named_scope :done, :conditions => {:done => true}
  named_scope :undone, :conditions => {:done => nil }

  def after_create
    self.tag_list = self.entry.scan(/#(\w+)/).join(', ')
    self.save
  end
end


