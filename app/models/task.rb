class Task < ActiveRecord::Base
  acts_as_taggable

  #default_scope :order => 'created_at DESC'
  #named_scope :active, lambda {{ :conditions => ['done = ? AND expire_at > ?', false, Time.now.utc] }}

  named_scope :by_day, lambda {|d|{ :conditions => {:created_at => d.to_time.utc..d.end_of_day.utc} }}
  named_scope :sticky, :conditions => {:sticky => true}
  named_scope :done, :conditions => {:done => true}
  named_scope :undone, :conditions => {:done => nil }

  def after_create
    self.tag_list = self.entry.scan(/#(\w+)/).join(', ')
    self.save
  end

  def self.find_by_slug(slug)
    case slug
    when /\d+/
     self.by_day(Date.parse(slug)) | self.sticky
    else
     self.tagged_with(slug)
    end
  end

end
