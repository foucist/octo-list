class Task < ActiveRecord::Base
  named_scope :by_day, lambda { |d| { :conditions => {:created_at => d.beginning_of_day..d.end_of_day} } }
  named_scope :sticky, :conditions => {:sticky => true}
  named_scope :done, :conditions => {:done => true}
  named_scope :undone, :conditions => {:done => nil }
end
